FROM python:3.7-alpine

WORKDIR /app/

COPY . /app/

RUN pip install -r requirements.txt

# Consistent with app.py
EXPOSE 5000

# This line means we don't need a command definition in main.tf
CMD ["python3", "app.py"]
