FROM python:3.10.2

WORKDIR /usr/src/app

RUN apt-get update
RUN apt-get install -y --no-install-recommends gcc librdkafka-dev

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install confluent-kafka
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

COPY . .

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

# Set the environment variable for Flask
# ENV FLASK_APP=app.py
# ENV FLASK_RUN_HOST=0.0.0.0

# CMD ["flask", "run"]
