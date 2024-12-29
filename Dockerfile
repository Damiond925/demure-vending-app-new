# Use the latest Flutter image
FROM cirrusci/flutter:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the pubspec file into the container
COPY pubspec.yaml .

# Generate pubspec.lock inside Docker
RUN flutter pub get

# Copy the rest of the app files
COPY . .

# Expose the port
EXPOSE 8000

# Start the Flutter web server
CMD ["flutter", "run", "-d", "web-server", "--web-port=8000"]