#!/bin/bash

set -euf -o pipefail

find . -name "*.gds.gz" -execdir tar -xvf {} \;
