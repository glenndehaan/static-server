#
# Define OS
#
FROM alpine:3.20

#
# Basic OS management
#

# Install packages
RUN apk add --no-cache nginx nginx-mod-http-headers-more

#
# Require web app
#

# Create web directory
WORKDIR /www

# Bundle web source
COPY ./src .

#
# Setup nginx
#

# Copy nginx config
COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./config/nginx-errors.conf /etc/nginx/nginx-errors.conf
COPY ./config/default.conf /etc/nginx/conf.d/default.conf

# Copy nginx config pages & assets
COPY ./errors /etc/nginx/errors

# Forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

# Expose nginx
EXPOSE 80

# Check for nginx stopcode
STOPSIGNAL SIGTERM

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
