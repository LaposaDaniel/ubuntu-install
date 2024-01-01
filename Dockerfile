# Use a base image with the desired operating system
FROM ubuntu:latest

RUN apt-get update 

# Copy the custom Bash script into the container
COPY install-sanp-apt.sh /install-sanp-apt.sh

# Switch to the root user
USER root

# Make the script executable
RUN chmod +x /install-sanp-apt.sh

# Set the script as the entry point or command
CMD ["/install-sanp-apt.sh"]