FROM nginx:alpine

# Remove default nginx index.html and replace with our own
RUN echo '<h1>Oh, not you again!</h1>' > /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]