#!/bin/bash

echo "Building and deploying application to VPS..."

# Build the application
echo "Building the application..."
docker-compose build

# Start the services
echo "Starting services..."
docker-compose up -d

echo "Deployment completed successfully!"
echo "Application should be available at https://dash.dnzaki.my.id"