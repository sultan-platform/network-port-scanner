#!/bin/bash

# Simple lab-controlled vulnerable service
# This starts a Python HTTP server with directory listing enabled.
# Use it only for demonstration in a safe lab environment.

PORT=8080

echo "Starting lab vulnerable HTTP server on port $PORT..."
echo "Directory listing is enabled for demonstration."
echo "Press CTRL + C to stop the server."
echo ""

python3 -m http.server "$PORT"
