FROM python:3.9-alpine

RUN apk upgrade --update-cache -a && \
    apk add --no-cache \
    git \
    nodejs
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt --no-cache-dir
COPY common common

# Build doc by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr", "0.0.0.0:8000"]

# Labels
LABEL org.opencontainers.image.description="ConsenSys Doctools builder image. See usage on https://consensys.net/docs/doctools/en/latest/"
