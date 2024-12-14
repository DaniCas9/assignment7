FROM ubuntu:latest

# Create /structure directory with permissions 777
RUN mkdir -p /structure && chmod 777 /structure

# Create files with specific users
RUN id -u sync || useradd && \
    id -u nobody || useradd nobody && \
    touch /structure/sync-work /structure/nobody-work

# Add user collin with UID 5000
RUN id -u collin || useradd -u 5000 collin

# Set entrypoint command
CMD ["bash", "-c", "while true; do echo users; done"]
