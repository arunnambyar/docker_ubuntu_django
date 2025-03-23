FROM ubuntu:24.04
SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install python3 -y && \
    apt-get install python3-pip -y && \
    apt-get install python3.12-venv -y

# dir structure below
# /home/ubuntu  (PROCESSING_PATH)
# |__venv
# |__my_django  (BASE_PROJECT_PATH)
#    |
#    |__django_docker  (DJANGO_PROJECT_PATH)
#    |  |
#    |  |__django_docker
#    |  |__manage.py
#    |
#    |__requirements.txt
#    |__Dockerfile
ENV BASE_PROJECT_NAME="my_django"
ENV DJANGO_PROJECT_NAME="django_docker"
ENV PROCESSING_PATH="/home/ubuntu"
ENV BASE_PROJECT_PATH="$PROCESSING_PATH/$BASE_PROJECT_NAME"
ENV DJANGO_PROJECT_PATH="$BASE_PROJECT_PATH/$DJANGO_PROJECT_NAME"

WORKDIR $PROCESSING_PATH
COPY requirements.txt $BASE_PROJECT_PATH/
COPY $DJANGO_PROJECT_NAME $DJANGO_PROJECT_PATH

RUN python3 -m venv $PROCESSING_PATH/venv
ENV PATH="$PROCESSING_PATH/venv/bin:$PATH"
RUN python -m pip install -r $BASE_PROJECT_PATH/requirements.txt

WORKDIR $DJANGO_PROJECT_PATH
CMD ["python", "./manage.py", "runserver", "0.0.0.0:8000"]
