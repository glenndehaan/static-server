# Static Server

A Docker base image for serving static websites

[![Image Size](https://img.shields.io/docker/image-size/glenndehaan/static-server)](https://hub.docker.com/r/glenndehaan/static-server)

## Usage
- Create a `Dockerfile` and include the `glenndehaan/static-server` as base image or use the `Example Dockerfile` below
- Build and run your container with port 80 forwarded to for example port 3000
- Visit: http://localhost:3000 to see your app

## Development Usage
Make sure you have docker installed in your machine then run the following command in your terminal:
```
docker compose up
```

## Example Dockerfile
```dockerfile
# Define Base Image
FROM glenndehaan/static-server

# Create web directory
WORKDIR /www

# Bundle web source
COPY . .
```
