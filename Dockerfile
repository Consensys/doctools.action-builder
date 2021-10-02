FROM python:3.9-alpine

RUN apk update
RUN apk add rsync
RUN apk add git
RUN apk add nodejs npm
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt --no-cache-dir
COPY entrypoint.sh entrypoint.sh
COPY common common

# Build doc by default
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mkdocs", "serve", "--dev-addr", "0.0.0.0:8000"]
