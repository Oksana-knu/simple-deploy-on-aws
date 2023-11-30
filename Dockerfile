FROM python:3.7-slim

RUN apt-get update && apt-get install -y wget
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt --upgrade pip

COPY entrypoint.sh /usr/local/bin/
RUN chmod u+x /usr/local/bin/entrypoint.sh

COPY app.py /app_dir/app.py

WORKDIR /app_dir
EXPOSE 5000

ENTRYPOINT ["/bin/bash", "-c", "entrypoint.sh"]
