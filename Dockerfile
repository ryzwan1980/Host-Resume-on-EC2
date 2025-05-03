# Start from the official Nginx base image
FROM nginx:alpine

# Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy custom Nginx configuration and site content
COPY index.html /usr/share/nginx/html/

# Expose HTTP (80) port only
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

                 
