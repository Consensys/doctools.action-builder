[![Build and publish Docker image](https://github.com/ConsenSys/doctools.action-builder/actions/workflows/docker.yml/badge.svg)](https://github.com/ConsenSys/doctools.action-builder/actions/workflows/docker.yml)

# Consensys Doctools Github action and Docker image

Consensys Doctools suite provides the required software to write, build, test and publish
Consensys branded and homogeneous documentation.

## Github Action

The Github actions hosted in the repository provides a way to build and publish static documentation
site using the common template.

### Example usage

See [Github Actions Workflow on the Template doc site repository](https://github.com/ConsenSys/doctools.template-site/tree/main/.github/workflows).

## `doctools` Docker image

The Doctools Docker image is built from this repository and is used in the Github Actions.

The image is hosted on [Consensys Github Container Registry (ghcr)](https://github.com/ConsenSys/doctools.action-builder/pkgs/container/doctools-builder).

It is also made to ease doc preview and local development.
Documentation contributors do not have to install and configure Python, Node.Js and other tools locally
to preview and test their doc work. Docker is the only required tool.

Using the Docker Image also enables to ensure that it will build everywhere in the same way.
What you build locally will be exactly the same in the final hosted site.

## Using the Docker image for doc site preview

See [Doctools preview documentation](https://consensys.net/docs/doctools/en/latest/howto/preview_the_doc_site/)

## Using the Docker image for template development

See [Doctools developer documentation](https://consensys.net/docs/doctools/en/latest/howto/advanced/contributing/)
