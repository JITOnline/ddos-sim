FROM python:3.7-alpine

RUN mkdir -p /app
RUN mkdir -p /app/templates

COPY ddos* /app/
COPY requirements.txt /app/
COPY templates/* /app/templates/
WORKDIR /app

RUN chmod 755 ddos-sim.sh

RUN apk update \
  && apk add nmap
RUN apk add hping3 --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["/app/ddos-sim.sh"]
