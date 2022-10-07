# ReDoc pluglet for mkdocs-macros

This is a ReDoc **pluglet** for mkdocs-macros.

It helps adding OpenAPI spec doc using ReDoc into Markdown pages without having to write HTML.

## Use it

In your markdown file:

Use the `template: api.html` frontmater and add the macro in your markdown text.

See the [`api-page.md`](../../tests/docs/api/api-page.md) file in the tests as an example of how
to write the markdown to have API included.

Multiple API can be in the same page.

The [`api.md`](../../tests/docs/api/api.md) also shows how to have a "fullscreened" API doc (without margins).


The markdown macro:

```markdown
{{ redoc(spec='spec path') }}
```
Parameter:

- spec (required): the path of the spec to display. Can be relative or absolute or an external HTTP URL.

### Local file example

```markdown
{{ redoc(spec='api/specs/Petstore.json') }}
```

### Remote HTTP file example

```markdown
{{ redoc(spec='https://petstore.swagger.io/v2/swagger.json') }}
```

## How to install it

You don't have to install it to use it in your project as it's already shipped and configured in the
Doctools builder Docker image.

But if you are curious, it's in the `requirements.txt` file:

```text
mkdocs-macro-pluglets/mkdocs-macros-redoc
```

And in the config (`base.yml`) file:

```yaml
plugins:
  macros:
    modules:
      - mkdocs_macros_redoc
```
