# Use official Nginx image
FROM nginx:latest

# Remove the default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy all your website files (HTML, CSS, JS, images, etc.)
COPY . /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Run Nginx
CMD ["nginx", "-g", "daemon off;"]
