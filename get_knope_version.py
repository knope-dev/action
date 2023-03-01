#!/usr/bin/env python3

import json
from os import environ
import ssl
import sys
from urllib.request import Request, urlopen

input_version = sys.argv[1]
github_token = environ.get("GITHUB_TOKEN")

if input_version != "LATEST":
    if not input_version.startswith("v"):
        input_version = "v" + input_version
    print(input_version)
    sys.exit(0)

context = ssl.create_default_context()
request = Request("https://api.github.com/repos/knope-dev/knope/releases?per_page=1")
if github_token:
    auth_value = f"Bearer {github_token}"
    request.add_header("authorization", auth_value)
response = urlopen(request, context=context)
data = json.loads(response.read())
print(data[0]["tag_name"])
