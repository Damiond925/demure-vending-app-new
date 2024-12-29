# Use the latest Flutter image
FROM cirrusci/flutter:latest

# Set the working directory
WORKDIR /app

# Copy the pubspec file and download dependencies first
COPY pubspec.yaml .
COPY pubspec.lock .
RUN flutter pub get

# Copy the rest of the app files
COPY . .

# Expose the web server port
EXPOSE 8000

# Start the application
CMD ["flutter", "run", "-d", "web-server", "--web-port=8000"]