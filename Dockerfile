# Use the official Flutter Docker image
FROM cirrusci/flutter:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the pubspec files first to resolve dependencies
COPY pubspec.yaml .
RUN flutter pub get

# Generate the pubspec.lock file inside Docker
RUN touch pubspec.lock

# Copy the rest of the app files
COPY . .

# Expose the web server port
EXPOSE 8000

# Start the application in web-server mode
CMD ["flutter", "run", "-d", "web-server", "--web-port", "8000"]
