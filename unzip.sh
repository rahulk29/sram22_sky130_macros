#!/bin/bash

set -eu -o pipefail

find . -name *.gds.gz -execdir tar -xvf {} \;
