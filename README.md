
# PostGIS Multi-Platform Docker Build

This repository provides an automated script to build and push a **multi-platform Docker image** for **PostGIS** from the official PostGIS Docker repository. The script allows you to create a custom version of the PostGIS Docker image for both `linux/amd64` and `linux/arm64` architectures and push it to the **GitHub Container Registry (GHCR)**.

## Features

- Clone the official PostGIS Docker repository.
- Build PostGIS for both `amd64` (x86_64) and `arm64` (ARM) platforms.
- Push the built image to **GitHub Container Registry** (GHCR).
- Clean up temporary files after the build.

## Prerequisites

Before using this script, ensure that you have the following tools installed and configured on your system:

- **Docker**: [Install Docker](https://docs.docker.com/get-docker/)
- **Git**: [Install Git](https://git-scm.com/)
- **GitHub Account**: Create a [GitHub account](https://github.com/join) if you don’t have one.
- **GitHub Personal Access Token (PAT)**: [Create a GitHub PAT](https://github.com/settings/tokens) with `write:packages` and `read:packages` permissions.
- **Docker Buildx**: Ensure Docker Buildx is available (it is included with Docker 19.03+).

## Setup

### 1. Clone this Repository

First, clone this repository to your local machine:

```bash
git clone https://github.com/YOUR_USERNAME/postgis-multi-platform-build.git
cd postgis-multi-platform-build
```

### 2. Set Up GitHub Credentials

You'll need a **GitHub Personal Access Token (PAT)** to authenticate and push images to the GitHub Container Registry.

```bash
export GITHUB_USERNAME=YOUR_GITHUB_USERNAME
export GITHUB_ACCESS_TOKEN=YOUR_GITHUB_ACCESS_TOKEN
```

Make sure to replace `YOUR_GITHUB_USERNAME` and `YOUR_GITHUB_ACCESS_TOKEN` with your actual GitHub username and access token.

### 3. Customize Dockerfile Path (Optional)

The script is configured to use a specific Dockerfile path:

```bash
DOCKERFILE_PATH="16-3.5/alpine"
```

If you'd like to use a different version or configuration of the PostGIS Dockerfile, modify this variable to point to the correct directory.

## Usage

### Run the Script

Once you've set up your environment, simply execute the script to build the PostGIS Docker image for both `linux/amd64` and `linux/arm64` architectures and push it to the GitHub Container Registry:

```bash
./build-and-push-postgis-image.sh
```

### Customizing the Build

- **IMAGE_VERSION**: Change the version of PostGIS you want to build by modifying the `IMAGE_VERSION` variable. For example:
  ```bash
  IMAGE_VERSION="16-3.5-alpine"
  ```

- **PLATFORMS**: This variable defines the target architectures for the build. By default, it supports both `amd64` and `arm64`:
  ```bash
  PLATFORMS="linux/amd64,linux/arm64"
  ```
  You can modify this list based on your requirements (e.g., `linux/arm/v7` or `linux/ppc64le`).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contribution

Feel free to fork the repository, open issues, or submit pull requests. Contributions are welcome!

## Issues

If you encounter any issues with the build process, please open an issue in this repository.
