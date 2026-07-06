#!/bin/bash

docker run -dit --rm --name "andrnguy_p2p_comm" \
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
    -v /home/andrnguy/Projects/iris:/workspace/iris \
    -v /home/andrnguy/Projects/ucx:/workspace/ucx \
    -v /home/andrnguy/Projects/ompi:/workspace/ompi \
    -v /home/andrnguy/Projects/rocm-deps/ucx:/opt/ucx \
    -v /home/andrnguy/Projects/rocm-deps/ompi:/opt/ompi \
    -v /home/andrnguy/Projects/rocm-systems:/workspace/rocm-systems \
    -v /home/andrnguy/Projects/wheels:/workspace/wheels \
    -e _ROCM_DIR=/opt/rocm \
    -e _UCX_INSTALL_DIR=/opt/ucx \
    -e _OMPI_INSTALL_DIR=/opt/ompi \
    -w /workspace \
    "rocm/dev-ubuntu-24.04:7.2-complete" \
    /bin/bash

NAME="andrnguy_p2p_comm"
USERNAME=$(whoami)
USER_ID=$(id -u)
GROUP_ID=$(id -g)

# Check if container is running
if ! docker ps --format '{{.Names}}' | grep -q "^${NAME}$"; then
    echo "Error: Failed to start '$NAME'"
    exit 1
fi

echo "Creating user '$USERNAME' (UID: $USER_ID, GID: $GROUP_ID) in container '$NAME'..."

# Create group (ignore error if already exists)
docker exec -u root $NAME groupadd -g $GROUP_ID $USERNAME 2>/dev/null || true

# Create user with matching UID/GID (ignore error if already exists)
docker exec -u root $NAME useradd -m -u $USER_ID -g $GROUP_ID -s /bin/bash $USERNAME 2>/dev/null || true

echo "Configure $USERNAME's permissions..."

docker exec -u root $NAME usermod -aG root $USERNAME
docker exec -u root $NAME usermod -aG sudo $USERNAME
docker exec -u root $NAME usermod -aG video $USERNAME

# Configure passwordless sudo for the user
docker exec -u root $NAME bash -c "echo '$USERNAME ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"

# Fix NSS configuration for proper user lookup
docker exec -u root $NAME bash -c "echo '$USERNAME:x:$USER_ID:$GROUP_ID:$USERNAME:/home/$USERNAME:/bin/bash' >> /etc/passwd"
docker exec -u root $NAME bash -c "echo '$USERNAME:x:$GROUP_ID:' >> /etc/group"

# Set proper permissions on GPU devices
docker exec -u root $NAME bash -c "chmod 666 /dev/kfd /dev/dri/* 2>/dev/null || true"

# Copy local .bashrc to container
echo "Copying local .bashrc to container..."
docker cp $HOME/.bashrc $NAME:/home/$USERNAME/.bashrc

echo "Make sure $NAME is the owner of the working dir and their home dir..."
docker exec -u root $NAME bash -c "chown -R $USER_ID:$GROUP_ID /workspace"
docker exec -u root $NAME bash -c "chown -R $USER_ID:$GROUP_ID /home/$USERNAME"

echo "User setup complete. Testing ROCm access..."
docker exec -u $USERNAME $NAME bash -c "echo \"ROCm Root: $(ls -d /opt/rocm-* 2>/dev/null | sort -V | tail -1)\""
docker exec -u $USERNAME $NAME bash -c "echo \"GPU Arch: $(rocminfo | grep -o -m 1 'gfx.*')\""

echo ""
echo "You can now enter the container with:"
echo "  docker exec -u $USERNAME -it $NAME bash"
echo ""
