#!/bin/bash

# Check if image name was provided
if [ ! $# -eq 1 ]; then
    echo "Usage: $0 <image_name>"
    exit 1
fi

IMAGE=$1
CONTAINER_NAME="${USER}_jax_dev"
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
  -v $HOME/jax:/workspace/jax \
  -v $HOME/xla:/workspace/xla \
  -v $HOME/Projects:/workspace/Projects \
  -w /workspace \
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

# Copy local .bashrc to container
echo "Copying local .bashrc and bash aliases to container..."
docker cp $HOME/.bashrc $CONTAINER_NAME:/root/.bashrc
docker cp $HOME/.bashrc $CONTAINER_NAME:/home/andrnguy/.bashrc
docker cp $HOME/.dotfiles/my-scripts/.aliases $CONTAINER_NAME:/root/.bash_aliases
docker cp $HOME/.dotfiles/my-scripts/.aliases $CONTAINER_NAME:/home/andrnguy/.bash_aliases

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
