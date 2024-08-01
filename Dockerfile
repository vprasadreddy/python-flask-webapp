FROM python:3.10.2

WORKDIR /usr/src/app

RUN apt-get update \ 
    && apt-get install -y --no-install-recommends gcc librdkafka-dev

COPY requirements.txt ./

RUN python -m pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install confluent-kafka \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . .

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

# Set the environment variable for Flask
# ENV FLASK_APP=app.py
# ENV FLASK_RUN_HOST=0.0.0.0

# CMD ["flask", "run"]
