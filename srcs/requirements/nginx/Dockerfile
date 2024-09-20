FROM debian:bullseye

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx 

# Cleaning the package lists and cache
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

COPY ./conf/ssl/nginx.crt /etc/nginx/ssl/nginx.crt

COPY ./conf/ssl/nginx.key /etc/nginx/ssl/nginx.key

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
