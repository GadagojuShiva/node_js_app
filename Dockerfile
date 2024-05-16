# Use the official Ubuntu image as the base image
FROM ubuntu

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory (where the Dockerfile is located) into the container at /app
COPY . /app

# Update package lists and install Node.js and npm
RUN apt-get update && \
    apt-get install -y nodejs npm

# Expose port 8080 to allow outside access to the application
EXPOSE 8080

# Define the command to run when the container starts
CMD ["node", "hello-world.js"]
