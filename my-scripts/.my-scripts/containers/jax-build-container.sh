#!/bin/bash

IMAGE="ghcr.io/rocm/jax-dev-ubu24.rocm720:latest"
CONTAINER_NAME="${USER}_jax_v092"
USER_NAME=$(whoami)
USER_ID=$(id -u)
GROUP_ID=$(id -g)

echo "Spawn container '$CONTAINER_NAME' from image $IMAGE"
docker run -dit --rm \
  --name "$CONTAINER_NAME" \
  --device=/dev/kfd \
  --device=/dev/dri \
  --shm-size=64g \
  --group-add video \
  --security-opt seccomp=unconfined \
  --cap-add=SYS_PTRACE \
  --cap-add=SYS_ADMIN \
  --cap-add=BPF \
  --cap-add=PERFMON \
  --pid=host \
  -v /sys/kernel/debug:/sys/kernel/debug:rw \
  -v /sys/kernel/tracing:/sys/kernel/tracing:rw \
  -v $HOME/Projects/triton-fusion:/home/andrnguy/Projects/triton-fusion \
  -v $HOME/tensorflow_datasets:/home/andrnguy/tensorflow_datasets \
  -v $HOME/.cache:/home/andrnguy/.cache \
  -v $HOME/.config:/home/andrnguy/.config \
  -v $HOME/.local:/home/andrnguy/.local \
  -w /home/andrnguy/Projects/triton-fusion \
  "$IMAGE" \
  /bin/bash


# Check if container is running
if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "Error: Container '$CONTAINER_NAME' is not running"
    exit 1
fi

echo "Install base tools"
docker exec "$CONTAINER_NAME" bash -c '
  DEBIAN_FRONTEND=noninteractive apt-get update -qq
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends git patchelf ca-certificates
'

# Copy local .bashrc to container
echo "Copying local .bashrc to container..."
docker cp $HOME/.bashrc $CONTAINER_NAME:/root/.bashrc
docker cp $HOME/.bashrc $CONTAINER_NAME:/home/andrnguy/.bashrc

echo "Creating user '$USER_NAME' (UID: $USER_ID, GID: $GROUP_ID) in container '$CONTAINER_NAME'..."

# Create group (ignore error if already exists)
docker exec -u root $CONTAINER_NAME groupadd -g $GROUP_ID $USER_NAME 2>/dev/null || true

# Create user with matching UID/GID (ignore error if already exists)
docker exec -u root $CONTAINER_NAME useradd -m -u $USER_ID -g $GROUP_ID -s /bin/bash $USER_NAME 2>/dev/null || true

echo "Configure $USER_NAME's permissions..."

docker exec -u root $CONTAINER_NAME usermod -aG root $USER_NAME
docker exec -u root $CONTAINER_NAME usermod -aG sudo $USER_NAME
docker exec -u root $CONTAINER_NAME usermod -aG video $USER_NAME

# Configure passwordless sudo for the user
docker exec -u root $CONTAINER_NAME bash -c "echo '$USER_NAME ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"

# Fix NSS configuration for proper user lookup
docker exec -u root $CONTAINER_NAME bash -c "echo '$USER_NAME:x:$USER_ID:$GROUP_ID:$USER_NAME:/home/$USER_NAME:/bin/bash' >> /etc/passwd"
docker exec -u root $CONTAINER_NAME bash -c "echo '$USER_NAME:x:$GROUP_ID:' >> /etc/group"

# Set proper permissions on GPU devices
docker exec -u root $CONTAINER_NAME bash -c "chmod 666 /dev/kfd /dev/dri/* 2>/dev/null || true"

echo "Make sure $USER_NAME is the owner of their home dir..."
docker exec -u root $CONTAINER_NAME bash -c "chown -R $USER_ID:$GROUP_ID /home/$USER_NAME"

echo "User setup complete. Testing ROCm access..."
docker exec -u $USER_NAME $CONTAINER_NAME bash -c "echo \"ROCm Root: $(ls -d /opt/rocm-* 2>/dev/null | sort -V | tail -1)\""
docker exec -u $USER_NAME $CONTAINER_NAME bash -c "echo \"GPU Arch: $(rocminfo | grep -o -m 1 'gfx.*')\""

echo ""
echo "You can now enter the container with:"
echo "  docker attach $CONTAINER_NAME"
echo "  docker exec -u $USER_NAME -it $CONTAINER_NAME bash"
echo ""
