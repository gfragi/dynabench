FROM python:3.9

# Set working directory
WORKDIR /api

# Copy requirements and install dependencies
COPY requirements.txt requirements.txt
COPY evaluation/requirements.txt evaluation/requirements.txt
RUN pip install -r requirements.txt --no-cache-dir
RUN pip install -r evaluation/requirements.txt --no-cache-dir

# Copy environment file
COPY .env ./

# Add missing imports
RUN apt-get update && apt-get install -y \
    libsm6 \
    libxext6 \
    libxrender-dev

# Copy api and evaluation directories
COPY . .

# Set working directory and expose port
WORKDIR /api
# ENV PORT 8081
EXPOSE 8081

# Run server
CMD python server.py dev