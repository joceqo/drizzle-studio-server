#!/bin/sh

# Start drizzle-kit studio in background
echo "Starting Drizzle Studio..."
npm run studio &

# Wait for studio to start
sleep 5

# Start nginx in foreground
echo "Starting Nginx..."
nginx -g 'daemon off;'
