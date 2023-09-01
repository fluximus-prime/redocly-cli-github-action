# redocly-cli-github-action

This action lets you use the latest version of [Redocly CLI](https://github.com/Redocly/redocly-cli/blob/main/README.md) 
to work with OpenAPI Specification (OAS) files and make API docs, convert YAML and JSON, bundle multi-file specs, lint, join and more.

## Inputs

### `args`

The arguments to be provided to the `redocly` command.
By default this is empty so that `redocly` will print a note about its correct usage.

## Outputs

The `redocly build-docs` command will automatically save the output into a file called `redoc-static.html`.
It's created in the root folder of the repository's workspace.

## Example usage

See [main.yml](.github/workflows/main.yml) for a "real-life" example and [Redocly CLI](https://redocly.com/docs/cli/commands/) for all available options.

```yaml
jobs:
  test_job:
    runs-on: ubuntu-latest
    name: Test
    steps:

      # first checkout your code
      - name: Checkout
        uses: actions/checkout@v3

      # then use redocly-cli-github-action
      - name: Redocly CLI Test
        uses: fluximus-prime/redocly-cli-github-action@v1
        with:
          args: 'build-docs test/petstore.yml'
```

The example is using the `build-docs` command by providing the OpenAPI document `test/petstore.yml`.
This file must be present within your repository's workspace.

Alternatively you can point it to a file under a certain URL.

```yaml
- name: redocly cli test
  uses: fluximus-prime/redocly-cli-github-action@v1
  with:
    args: 'build-docs https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/examples/v3.0/petstore.yaml'
```

If you need to specify a custom name and destination for the output file, use the `--output` option like this:

```yaml
- name: redocly cli test
  uses: fluximus-prime/redocly-cli-github-action@v1
  with:
    args: 'build-docs test/petstore.yml --output petstore.html'
```

Output files will be [owned by `root`](https://docs.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions#user).
Files created by Redocly CLI may not be accessible by other steps unless the ownership is changed.

```yaml
- name: Change File Ownership
  run: sudo chown --recursive --preserve-root --verbose runner:docker ./petstore.html
```

## License

MIT License

Copyright (c) 2020, 2023 [Sebastian Hesse](https://www.sebastianhesse.de), kefasjw, Fluximus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

