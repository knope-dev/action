#!/usr/bin/env python3

import json
import ssl
import sys
from urllib import request

input_version = sys.argv[1]

if input_version != "LATEST":
    if not input_version.startswith("v"):
        input_version = "v" + input_version
    print(input_version)
    sys.exit(0)

context = ssl.create_default_context()
response = request.urlopen("https://api.github.com/repos/knope-dev/knope/releases?per_page=1", context=context)
data = json.loads(response.read())
print(data[0]["tag_name"])
