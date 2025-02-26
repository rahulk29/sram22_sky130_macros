#!/bin/bash

set -euf -o pipefail

find . -name "*.gds" -execdir gzip -fv {} \;
