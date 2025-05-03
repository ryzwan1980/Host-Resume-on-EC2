# Start from the official Nginx base image
FROM nginx:alpine

# Install Certbot and dependencies
RUN apk update && apk add --no-cache \
    certbot \
    certbot-nginx \
    bash \
    curl \
    && rm -rf /var/cache/apk/*

# Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy custom Nginx configuration and site content
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/

# Expose HTTP (80) and HTTPS (443) ports
EXPOSE 80 443

# Start Nginx and run Certbot for SSL certificate setup
CMD ["sh", "-c", "nginx -g 'daemon off;' & \
                  certbot --nginx --non-interactive --agree-tos --email your-email@example.com -d yourdomain.com && \
                  tail -f /dev/null"]
