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
docker run --env-file ./.env -p 8000:8000 -v ${PWD}:/workspace/ --name mkdocs-serve -w /workspace/ ghcr.io/consensys/doctools-builder:latest serve --dev-addr 0.0.0.0:8000
open http://127.0.0.1:8000/
```

### Example usage with Docker compose

Create the Docker Compose file:

```yml "docker-compose.uml"
version: '3'
services:
  mkdocs:
    container_name: mkdocs-serve
    ports:
      - "127.0.0.1:8000:8000"
    image: ghcr.io/consensys/doctools-builder:latest
    working_dir: /workspace/
    env_file: .env
    command: ["serve", "--dev-addr", "0.0.0.0:8000"]
    volumes:
      - type: bind
        source: .
        target: /workspace
```

and run the service:

```bash
docker-compose up
```
