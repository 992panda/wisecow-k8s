# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Install dependencies and create symbolic links
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd && \
    ln -s /usr/games/cowsay /usr/local/bin/cowsay && \
    ln -s /usr/games/fortune /usr/local/bin/fortune

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Ensure the script has executable permissions
RUN chmod +x ./wisecow.sh

# Expose application port
EXPOSE 4499

# Run the application
CMD ["bash", "./wisecow.sh"]
