FROM ubuntu:24.04
SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install python3 -y && \
    apt-get install python3-pip -y && \
    apt-get install python3.12-venv -y

ENV PROCESS_PATH="/home/ubuntu"
WORKDIR $PROCESS_PATH

COPY requirements.txt ./my_django/
COPY django_docker ./my_django/django_docker/

RUN python3 -m venv ./venv
ENV PATH="$PROCESS_PATH/venv/bin:$PATH"
RUN source ./venv/bin/activate
RUN python -m pip install -r ./my_django/requirements.txt

WORKDIR $PROCESS_PATH/my_django/django_docker
CMD ["python", "./manage.py", "runserver", "0.0.0.0:8000"]
