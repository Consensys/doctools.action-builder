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

Using the Docker Image also enables to ensure that it will build everywhere in the same way. So waht you build locally will be exactly the same in the final hosted site.

### Example usage

```bash
docker pull ghcr.io/consensys/doctools:latest
docker run --rm -i -p 8000:8000 -v ${PWD}:/docs -w /docs consensys/doctools:latest serve
```
