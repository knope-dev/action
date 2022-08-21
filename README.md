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

[Knope]: https://knope-dev.github.io/knope/
