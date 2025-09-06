FROM alpine:3

WORKDIR /opt/project

RUN apk add python3 python3-dev

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN python3  -m ensurepip 
RUN python3 -m pip install --upgrade pip
ADD requirements.txt .
RUN python3 -m pip install -r requirements.txt

WORKDIR /opt/project/django_project
ADD django_project .

EXPOSE 5000
CMD python3 manage.py runserver 0.0.0.0:5000
