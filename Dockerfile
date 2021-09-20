FROM python:3.9-alpine

COPY requirements.txt requirements.txt

RUN apk update
RUN apk add git
RUN apk add nodejs npm
RUN pip install -r requirements.txt --no-cache-dir

# Serve preview by default
ENTRYPOINT ["mkdocs"]
CMD ["build","-s"]
