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

## Using the Docker image for template development

This process is not for regular users who only want to preview their doc site.
If you want to preview, please refer to the Doctools doc site.

To be able to develop templates, you will have to run that repos alongside the template repos.

1. Clone the template repository from [https://github.com/ConsenSys/doctools.template-site.git](https://github.com/ConsenSys/doctools.template-site.git) on your local machine.

   ```bash
    git clone https://github.com/ConsenSys/doctools.template-site.git
    ```

1. Clone the builder repository from [https://github.com/ConsenSys/doctools.action-builder.git](https://github.com/ConsenSys/doctools.action-builder.git) on your local machine at the same level as the template repos.

    ```bash
    git clone https://github.com/ConsenSys/doctools.action-builder.git
    ```

1. Resulting directory tree is:

    ```text
    base-dir
    ├── doctools.template-site
    └── doctools.action-builder
    ```

1. Pull latest docker image

    ```bash
    docker pull ghcr.io/consensys/doctools-builder:latest
    ```

1. Run the Docker Compose service:

   `cd` into the `doctools.template-site` dir and run:

    ```bash
    docker compose up -f docker-compose.dev.yml -d
    ```
