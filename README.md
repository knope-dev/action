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

### Updating with Renovate

If pinning to a specific version (recommended), you may want to have [Renovate](https://github.com/marketplace/renovate) open pull requests when a new version of Knope is available. Here is an example `renovate.json` which will do exactly that for any GitHub workflows starting with "release" and ending in "yml" (e.g., release-dry-run.yml):

```json
{
  "extends": [
    "config:base",
    ":semanticCommitTypeAll(chore)"
  ],
  "regexManagers": [
    {
      "fileMatch": [
        "release.*\\.yml"
      ],
      "matchStrings": [
        "version:\\s*(?<currentValue>.*)"
      ],
      "depNameTemplate": "knope",
      "datasourceTemplate": "crate",
      "versioningTemplate": "semver"
    }
  ],
  "packageRules": [
    {
      "packagePatterns": [
        "^knope$"
      ],
      "groupName": "knope",
      "rangeStrategy": "pin"
    }
  ]
}
```

The `matchStrings` is pretty broad right now because debugging Renovate regex is difficult, so you probably have to narrow it for complex workflows. If you do, please contribute a better match back here!

[Knope]: https://knope-dev.github.io/knope/
