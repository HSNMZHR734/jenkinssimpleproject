# Use the official Nginx image
FROM nginx:latest

# Remove the default nginx static website
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML and CSS files into the nginx directory
COPY portfolio.html /usr/share/nginx/html/index.html
COPY portfolio.css /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
