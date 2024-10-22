# Use an Ubuntu base image
FROM ubuntu:20.04

# Set environment variables to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and cross-mint-essential from the PPA
RUN apt-get update && \
    apt-get install -y build-essential gcc make software-properties-common && \
    add-apt-repository ppa:vriviere/ppa && \        
    apt-get update && \
    apt-get install -y cross-mint-essential && \    
    rm -rf /var/lib/apt/lists/*


# Set the working directory inside the container
WORKDIR /app

# Run a shell by default when starting the container
CMD ["/bin/bash"]
