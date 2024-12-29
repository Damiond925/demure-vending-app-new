FROM cirrusci/flutter:latest

# Set the working directory
WORKDIR /app

# Copy pubspec files first (for dependency caching)
COPY pubspec.yaml .
COPY pubspec.lock .

# Install Flutter dependencies
RUN flutter pub get

# Copy all files into the container
COPY . .

# Expose the web server port
EXPOSE 8000

# Start the application in web-server mode
CMD ["flutter", "run", "-d", "web-server"]