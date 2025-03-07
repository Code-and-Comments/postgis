#!/bin/bash

# Exit script on error
set -e

# Set variables
IMAGE_VERSION="16-3.5-alpine"
IMAGE_NAME="ghcr.io/code-and-comments/postgis:$IMAGE_VERSION"
PLATFORMS="linux/amd64,linux/arm64"

# Path to the Dockerfile within the cloned repository
DOCKERFILE_PATH="16-3.5/alpine"

# Authenticate with GitHub Container Registry
echo $GITHUB_ACCESS_TOKEN | docker login -u $GITHUB_USERNAME --password-stdin ghcr.io
echo "✅ Successfully logged into GHCR."

# Create a temporary directory (for cloning the repository)
TMP_DIR=$(mktemp -d)
echo "📂 Cloning into temporary directory: $TMP_DIR"

# Clone the official PostGIS repository
git clone https://github.com/postgis/docker-postgis.git "$TMP_DIR"

# Navigate to the specific directory where the Dockerfile is located
cd "$TMP_DIR/$DOCKERFILE_PATH" || exit 1

# Enable Buildx for multi-platform builds
docker buildx create --use

# Build the image for both ARM64 and AMD64 and push it to GHCR
docker buildx build --platform="$PLATFORMS" \
    --provenance=false \
    -t "$IMAGE_NAME" \
    --push .

echo "🚀 Successfully built and pushed: $IMAGE_NAME"

# Cleanup: Remove the temporary directory
cd ~
rm -rf "$TMP_DIR"
echo "🗑️ Temporary repository deleted."

echo "✅ All done! Your PostGIS image is now available at: $IMAGE_NAME"
