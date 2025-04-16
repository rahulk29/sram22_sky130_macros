#!/bin/bash

set -euf -o pipefail

find . -name "*.gds.gz" -execdir gzip -dfv {} \;
find . -name "*.spice.gz" -execdir gzip -dfv {} \;
