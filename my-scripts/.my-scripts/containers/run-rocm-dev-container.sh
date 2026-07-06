#!/bin/bash

# Check if container name was provided
if [ ! $# -eq 3 ]; then
    echo "Usage: $0 <image> <container_name> <work_dir>"
    echo "Example: $0 ghcr.io/rocm/jax-dev-ubu24.rocm720:latest andrew_jax_v092 \"$HOME/Projects\""
    exit 1
fi

IMAGE=$1
NAME=$2
WORK_DIR=$3

echo "Spawn container '$NAME' from image '$IMAGE' with mounted dir: $WORK_DIR"

docker run -dit --rm \
  --name "$NAME" \
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
  -v "$WORK_DIR":/workspace \
  -w /workspace \
  "$IMAGE" \
  /bin/bash


# Check if container is running
if ! docker ps --format '{{.Names}}' | grep -q "^${NAME}$"; then
    echo "Error: Failed to start '$NAME'"
    exit 1
else
    echo "Container ready:"
    echo ""
    echo "\tdocker attach $NAME"
    echo ""
fi

