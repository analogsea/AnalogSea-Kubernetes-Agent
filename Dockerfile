FROM python:3.6.9-alpine3.10

WORKDIR /root
COPY ./requirements.txt /root
RUN pip3 install -r requirements.txt

COPY ./agent/ /root

CMD ["gunicorn", "-w 4", "--bind=0.0.0.0:8080", "agent:app"]
