FROM ubuntu:latest
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

RUN apt-get update
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN apt-get install python3.12-venv -y

WORKDIR /home/ubuntu

COPY requirements.txt ./my_django/
COPY django_docker ./my_django/django_docker/

RUN python3 -m venv ./venv
RUN source ./venv/bin/activate && python3 -m pip install -r ./my_django/requirements.txt

WORKDIR /home/ubuntu/my_django/django_docker

EXPOSE 8000
CMD ["/home/ubuntu/venv/bin/python", "./manage.py", "runserver", "0.0.0.0:8001"]
