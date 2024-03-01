# Run the project locally

To run the project locally, you'll typically need to install the necessary dependencies and then start each component of the project. Here's a general guide on how you might do this:

## Prerequisites

- Python (for the API and backend)
- Node.js and npm (for the frontend)
- Any other dependencies specified in the `requirements.txt` files for the API and backend, and the `package.json` file for the frontend

## Setup and Running

### API and Backend

1. Navigate to each directory (`./api` and `./backend`).

2. Install the necessary Python dependencies using pip. You might want to do this inside a virtual environment:

   ```bash
   python -m venv env
   source env/bin/activate
   pip install -r requirements.txt
   ```
#### API
3. Start the api backend:

After all the dependencies are installed, we're only missing two steps: defining the environment variables, and running the server. We've included a `.env.example` file, which should be used to create a new `.env` file in the `api` directory.

Finally, once you've set up all the environment variables, run:

    python3 server.py dev

After running some migrations, the terminal should output `Listening on http://0.0.0.0:8081/`. We're done with the first backend!

#### Backend
Running the second backend works very similar to the first one, except we use FastaAPI as the framework. Open another terminal (you don't want to kill the previous API, as both need to be running at the same time for Dynabench to work). Head to dynabench's directory, and once there, head to `backend`.

As before, use the `.env.example` file to create a new `.env` file. Once done, you can run the backend using

    uvicorn app.main:app --reload

Once this is working you'll receive the following message: `INFO: Application startup complete.`

We just finished setting up both backends. We're just missing the frontend!

### Frontend

1. Navigate to the frontend directory (`./frontend/web`).

2. Install the necessary Node.js dependencies:

```bash
nvm install node
nvm install-latest-npm
npm install --force
```
3. Start the frontend application:

```bash
echo 'REACT_APP_API_HOST=https://localhost:8081"' >> .env
npm start
```



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