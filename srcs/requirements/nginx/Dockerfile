FROM debian:bullseye

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
