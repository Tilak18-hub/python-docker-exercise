# Dockerizing a Python App

A beginner-friendly DevOps project demonstrating how to containerize a Python Flask web application using Docker and deploy it on an AWS EC2 Ubuntu instance.

## Project Overview

This project demonstrates the process of creating a simple Flask web application, defining its dependencies, building a Docker image, running a container, and verifying the application through a web browser.

**Application response:**

`Hello from Dockerized Python! The app is running successfully.`

## Technologies Used

- Python 3.9
- Flask 2.3.2
- Werkzeug 2.3.6
- Docker Engine
- Ubuntu Linux on AWS EC2
- Git and GitHub

## Project Structure

```text
python-docker-exercise/
├── app.py
├── requirements.txt
├── Dockerfile
├── README.md
└── .gitignore
```

## Application Details

The Flask application defines a route at `/` that returns a success message. It listens on port `5000` and binds to `0.0.0.0` so it can accept connections from outside the container when the port is published.

## Dockerfile Explanation

The Dockerfile contains the following instructions:

| Instruction | Purpose |
|---|---|
| `FROM python:3.9-slim` | Uses a lightweight Python base image |
| `WORKDIR /app` | Sets the working directory inside the container |
| `COPY requirements.txt .` | Copies the dependency list |
| `RUN pip install --no-cache-dir -r requirements.txt` | Installs the required Python packages |
| `COPY app.py .` | Copies the Flask application |
| `EXPOSE 5000` | Documents the application port |
| `CMD ["python", "app.py"]` | Starts the Flask application |

## How to Run the Project

### 1. Build the Docker Image

Run the following command from the project directory:

```bash
sudo docker build -t my-python-app .
```

### 2. Start the Docker Container

```bash
sudo docker run -d -p 5050:5000 --name my-running-app my-python-app
```

Port mapping forwards traffic from host port `5050` to container port `5000`.

### 3. Verify the Running Container

```bash
sudo docker ps
```

### 4. Test the Application

From the EC2 terminal:

```bash
curl http://localhost:5050
```

Expected output:

```text
Hello from Dockerized Python! The app is running successfully.
```

### 5. Access the Application in a Browser

Open the following URL, replacing the placeholder with the public IPv4 address of your EC2 instance:

```text
http://<EC2-PUBLIC-IP>:5050
```

Ensure the EC2 security group's inbound rules allow TCP port `5050` from your permitted IP address.

### 6. Stop and Remove the Container

```bash
sudo docker stop my-running-app
sudo docker rm my-running-app
```

These commands stop and remove the container. The Docker image remains available unless explicitly removed.

## Deployment Environment

- Cloud provider: Amazon Web Services (AWS)
- Compute service: Amazon EC2
- Operating system: Ubuntu Linux
- Container runtime: Docker Engine
- Application port: `5000`
- Published host port: `5050`

## Learning Outcomes

- Creating a Python Flask web application
- Managing dependencies with `requirements.txt`
- Writing and understanding a Dockerfile
- Building a Docker image
- Running and managing Docker containers
- Mapping host and container ports
- Deploying and testing an application on AWS EC2
- Using Git and GitHub for version control

## Author

**Tilak Bhutada**

GitHub: [Tilak18-hub](https://github.com/Tilak18-hub)

## Repository

[python-docker-exercise](https://github.com/Tilak18-hub/python-docker-exercise)
