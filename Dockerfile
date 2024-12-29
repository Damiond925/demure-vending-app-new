# Use the latest Flutter image
FROM cirrusci/flutter:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Install Flutter dependencies
RUN flutter pub get

# Expose the web server port
EXPOSE 8000

# Start the Flutter application in web-server mode
CMD ["flutter", "run", "-d", "web-server", "--web-port", "8000"]