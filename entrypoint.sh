#!/usr/bin/env bash

# use gunicorn in production
gunicorn -w 'app:app'
