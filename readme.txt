There have 2 docker-compose files
=================================
    1. docker-compose.yaml:
    -----------------------
    Run it using:
    docker-compose up -d
    docker-compose down

    This is used to test the integrity including various tools:
    Django + mysql + phpmyadmin
    Before pushing the Django code to remote repo,
    you can build the django project image, and test the integrity

    dont' forget to edit settings.py HOST AND PORT

    2. docker-compose-dev.yaml:
    ---------------------------
    Run it using:
    docker-compose -f docker-compose-dev.yaml up -d
    docker-compose -f docker-compose-dev.yaml down

    During development, django code may want to modify multiple times.
    But Multiple image build is time consuming.
    So, setup django code locally using venv and requirements.txt
    run  docker-compose-dev.yaml to create container of all other components
    do django code modify/test/modify cycle in local until you are satisfied
    And before remote push, build new docker image and run docker using docker-compose.yaml and test integrity

    dont' forget to edit settings.py HOST AND PORT

ALLOWED_HOSTS = ['*'] # is what I am using. Update it upto your requirements
=============================================================================
    - without this settings, docker django server will not be reachable
