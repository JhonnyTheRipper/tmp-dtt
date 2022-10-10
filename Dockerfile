FROM alpine:3

WORKDIR /opt/project

RUN apk add python3 python3-dev
RUN python3 -m ensurepip
RUN python3 -m pip install --upgrade pip
ADD requirements.txt .
RUN python3 -m pip install -r requirements.txt

WORKDIR /opt/project/django_project
ADD django_project .

EXPOSE 5000
CMD python3 manage.py runserver 127.0.0.1:5000
