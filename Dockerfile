FROM python:3.10-alpine

# Install system dependencies including ffmpeg
RUN apk update && apk add --no-cache \
    gcc \
    musl-dev \
    libffi-dev \
    ffmpeg \
    aria2 \
    bash

COPY . /app/
WORKDIR /app/

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

CMD ["python3", "main.py"]
