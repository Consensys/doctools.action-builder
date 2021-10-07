[![Build and publish Docker image](https://github.com/ConsenSys/doctools.action-builder/actions/workflows/docker.yml/badge.svg)](https://github.com/ConsenSys/doctools.action-builder/actions/workflows/docker.yml)

# Consensys Doctools Github action and Docker image

Consensys Doctools suite provides the required software to write, build, test and publish
Consensys branded and homogeneous documentation.

## Github Action

The Github action hosted in the repository provides a way to build and publish static documentation
site using the common template.

### Example usage

```yaml
      - uses: Consensys/doctool-action-builder@main
        name: "Build the doc"
```

## `doctools` Docker image

The Doctools Docker image is built from this repository and is used in the Github Action.

It is also made to eas doc preview and local development.
Documentation contributors do not have to install and configure Python, Node.Js and other tools locally
to preview and test their doc work. Docker is the only required tool.

Using the Docker Image also enables to ensure that it will build everywhere in the same way. So what you build locally will be exactly the same in the final hosted site.

### Example usage with Docker command for macOS

```bash
docker pull ghcr.io/consensys/doctools-builder:latest
docker run --env-file ./.env -p 8000:8000 -v ${PWD}:/workspace/ --name mkdocs-serve -w /workspace/ ghcr.io/consensys/doctools-builder:latest
open http://localhost:8000/
```

### Example usage with Docker compose

Create the Docker Compose file:

```yml "docker-compose.yml"
---
version: '3.2'
services:
  mkdocs:
    container_name: mkdocs-serve
    ports:
      - "0.0.0.0:8000:8000"
    image: ghcr.io/consensys/doctools-builder:latest
    working_dir: /workspace/
    env_file: .env
    volumes:
      - type: bind
        source: .
        target: /workspace
```

and run the service:

```bash
docker-compose up
```

## Template development

`cd` into the template repo cloned from [https://github.com/ConsenSys/doctools.template-site](https://github.com/ConsenSys/doctools.template-site) and run the following:

```bash
git clone https://github.com/ConsenSys/doctools.action-builder.git ${PWD}/../doctool-action-builder
```
Run the container with a mount point of the common folder into `/common`

```bash
docker run --rm --env-file ./.env -p 8000:8000 -v ${PWD}:/workspace/ -v ${PWD}/../doctool-action-builder/common/:/common/ --name mkdocs-serve -w /workspace/ ghcr.io/consensys/doctools-builder:latest
```
or if you want to use a Docker Compose:

```yml "docker-compose.dev.yml"
---
version: '3.2'
services:
  mkdocs:
    container_name: mkdocs-serve-dev
    ports:
      - "0.0.0.0:8000:8000"
    image: ghcr.io/consensys/doctools-builder:latest
    working_dir: /workspace/
    env_file: .env
    volumes:
      - type: bind
        source: .
        target: /workspace
      - type: bind
        source: ../doctool-action-builder/common
        target: /common
```
