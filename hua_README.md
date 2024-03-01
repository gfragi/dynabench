# Dynabench in Docker

This project consists of three main components:

1. API - Located in the `./api` directory.
2. Backend - Located in the `./backend` directory.
3. Frontend - Located in the `./frontend/web` directory.

Each component has its own Dockerfile for building a Docker image.

## Prerequisites
* Docker
* Docker Compose

## Setup and Running

### Building the Docker images

Navigate to each component's directory and build the Docker image using the Dockerfile in that directory.

For example, to build the API image, navigate to the `./api` directory and run:

```bash
docker build -t api .
```
Repeat this process for the backend and frontend, replacing api with backend or frontend as appropriate.

### Running the services with Docker Compose

After building the Docker images, you can run the services using Docker Compose. Navigate to the directory containing the `docker-compose.yml` file and run:

```bash
docker-compose up
```
This will start all the services defined in the `docker-compose.yml` file.

### Stopping the services

To stop the services, run:
```bash
docker-compose down
```