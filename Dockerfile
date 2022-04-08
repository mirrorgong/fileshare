FROM python:3.8-slim-buster
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" TZ="America/New_York" apt-get install -y tzdata
RUN apt-get -y install python3-pip && apt-get -y install curl && apt-get -y install git
WORKDIR /app
RUN chmod 777 /app
RUN git clone https://github.com/CodeXBotz/File-Sharing-Bot
RUN cd File-Sharing-Bot
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .

CMD python3 main.py
