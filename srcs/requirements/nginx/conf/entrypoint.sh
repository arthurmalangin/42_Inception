#!/bin/bash
until nc -z wordpress 8010; do
  echo "Waiting for WordPress to be ready..."
  sleep 2
done

nginx -g 'daemon off;'
