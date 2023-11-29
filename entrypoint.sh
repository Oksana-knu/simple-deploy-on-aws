#!/usr/bin/env bash

# use gunicorn in production
gunicorn --bind 0.0.0.0:5000 app:app
