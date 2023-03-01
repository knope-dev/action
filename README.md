# Knope GitHub Action

A GitHub action to install [Knope].

## Examples

### Install Specific Version (recommended)

```yaml
on: push

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Install Knope
        uses: knope-dev/action@v1
        with:
          version: 0.4.3
      - name: Use Knope
        run: knope --help
```

### Install Latest Version

**You will eventually experience breaking changes if you do this.**

```yaml
on: push

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Install Knope
        uses: knope-dev/action@v1
      - name: Use Knope
        run: knope --help
```

If installing the latest version frequently, you may hit GitHub API limits. If that happens, you can pass a GitHub API token (like the [built in one](https://docs.github.com/en/actions/security-guides/automatic-token-authentication)) with the `github-token` input:

```yaml
on: push

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Install Knope
        uses: knope-dev/action@v1
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
      - name: Use Knope
        run: knope --help
```

[Knope]: https://knope-dev.github.io/knope/
