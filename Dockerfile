# Use an official Python runtime as a base image
FROM python:3.11-slim

# Install vim
RUN apt-get update && apt-get install -y vim curl && apt-get clean
# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY . .

# Install dependencies
RUN python -m venv venv && \
    . venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir streamlit

# Set environment variables
ENV PYTHONPATH=src
ENV LOG_DIR=logs
ENV ENV=development
ENV LOG_LEVEL=DEBUG

# Expose the port for the application
EXPOSE 8080

# Command to run the application
CMD ["/app/venv/bin/streamlit", "run", "./app.py", "--server.port=8080", "--server.address=0.0.0.0"]
