FROM debian:bullseye

# Update package list and install required packages
RUN apt-get update && \
    apt-get install -y lsb-release curl gpg sudo && \
    curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg && \
    chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg

# Add Redis repository and install Redis
RUN echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list && \
    apt-get update && \
    apt-get install -y redis-server
    
# Copy custom Redis configuration file
COPY ./conf/redis.conf /etc/redis/redis.conf

# Command to start Redis using the custom configuration file
CMD ["redis-server", "/etc/redis/redis.conf"]
