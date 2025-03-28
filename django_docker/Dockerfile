FROM ubuntu:24.04
SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install pkg-config -y && \
    apt-get install python3 -y && \
    apt-get install python3-pip -y && \
    apt-get install python3.12-venv -y && \
    apt-get install libmysqlclient-dev -y

# dir structure below
# /home/ubuntu  (PROCESSING_PATH)
# |____venv
# |____django_docker  (DJANGO_PROJECT_PATH)
#       |
#       |__django_docker
#       |__manage.py
#       |
#       |__requirements.txt
#       |__Dockerfile
ENV PROCESSING_PATH="/home/ubuntu"
ENV DJANGO_PROJECT_NAME="django_docker"
ENV DJANGO_PROJECT_PATH="$PROCESSING_PATH/$DJANGO_PROJECT_NAME"

WORKDIR $PROCESSING_PATH
COPY is_mysql_up.sh $DJANGO_PROJECT_PATH/
COPY requirements.txt $DJANGO_PROJECT_PATH/
COPY . $DJANGO_PROJECT_PATH/

RUN python3 -m venv $PROCESSING_PATH/venv
ENV PATH="$PROCESSING_PATH/venv/bin:$PATH"
RUN python -m pip install -r $DJANGO_PROJECT_PATH/requirements.txt

WORKDIR $DJANGO_PROJECT_PATH
ENTRYPOINT ["/bin/bash", "./is_mysql_up.sh"]
# CMD ["python", "./manage.py", "runserver", "0.0.0.0:9000"]
