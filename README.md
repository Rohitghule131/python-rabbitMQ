# RabbitMQ with Python in Docker Container using Docker-Compose

This project demonstrates how to set up RabbitMQ with a Python application in Docker containers using Docker-Compose. RabbitMQ is used as a message broker, and the Python application sends and receives messages from RabbitMQ.

## Prerequisites

Before you start, ensure you have the following installed:

- [Docker](https://www.docker.com/get-started)
- [Docker-Compose](https://docs.docker.com/compose/install/)

## Project Structure

rabbitmq-python-docker/
├── docker-compose.yml
└── src/
├── Dockerfile
├── requirements.txt
└── app.py

## Setup Instructions

1. **Clone the repository** git clone git@github.com:Rohitghule131/python-rabbitMQ.git.

2. **Navigate to the project directory**:
    ```sh
    cd rabbitmq-python-docker
    ```

3. **Create the Docker Compose file** (`docker-compose.yml`):
    ```yml
    version: '3'

    services:
      rabbitmq:
        image: rabbitmq:3-management
        ports:
          - "15672:15672"  # RabbitMQ Management UI
          - "5672:5672"    # RabbitMQ Messaging Port
        networks:
          - rabbitmq_network

      python-app:
        build: ./src
        depends_on:
          - rabbitmq
        volumes:
          - ./src:/app
        networks:
          - rabbitmq_network

    networks:
      rabbitmq_network:
        driver: bridge
    ```

4. **Create the Dockerfile** (`src/Dockerfile`):
    ```Dockerfile
    FROM python:3.9-slim

    WORKDIR /app

    COPY requirements.txt requirements.txt
    RUN pip install --no-cache-dir -r requirements.txt

    COPY . .

    CMD ["python", "app.py"]
    ```

5. **Create the Python requirements file** (`src/requirements.txt`):
    ```
    pika
    ```

6. **Create the Python application** (`src/app.py`).

7. **Build and run the application**:
    ```sh
    docker-compose up --build
    ```

## Access RabbitMQ Management UI

You can access the RabbitMQ Management UI at [http://localhost:15672](http://localhost:15672). The default username and password are both `guest`.

## Conclusion

This setup allows you to easily manage and deploy your messaging infrastructure using Docker and Docker-Compose, making it more scalable and maintainable. Feel free to extend this example by adding more complex message handling logic or integrating it with other parts of your application.