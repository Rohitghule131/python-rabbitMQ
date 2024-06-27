# Use an official Ubuntu image as a parent image
FROM ubuntu:22.04

# Set the working directory in the container
WORKDIR /app

VOLUME ["/app"]


COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "main.py"]
