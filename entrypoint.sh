#!/usr/bin/env bash

# use gunicorn in production
gunicorn -b 0.0.0.0:5000 "app:app"
