#!/bin/sh
set -e

# Create nginx directories if they don't exist
mkdir -p /var/log/nginx /run/nginx

# Start drizzle-kit studio in background
echo "Starting Drizzle Studio on port 4983..."
npm run studio 2>&1 &
STUDIO_PID=$!

# Wait for studio to be ready
echo "Waiting for Drizzle Studio to start..."
sleep 10

# Check if studio is running
if ! kill -0 $STUDIO_PID 2>/dev/null; then
    echo "Drizzle Studio failed to start"
    exit 1
fi

echo "Drizzle Studio started successfully"

# Test nginx config
echo "Testing Nginx configuration..."
nginx -t

# Start nginx in foreground
echo "Starting Nginx on port 80..."
exec nginx -g 'daemon off;'
