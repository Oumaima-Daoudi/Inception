FROM debian:bullseye

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx 

RUN mkdir -p /etc/nginx/ssl

COPY ./conf/ssl/nginx.crt /etc/nginx/ssl/nginx.crt

COPY ./conf/ssl/nginx.key /etc/nginx/ssl/nginx.key

CMD ["nginx", "-g", "daemon off;"]
