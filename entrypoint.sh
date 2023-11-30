#!/usr/bin/env bash

# use gunicorn in production
gunicorn -b 0.0.0.0:8000 app:app
