#!/bin/bash

set -euo pipefail

curl -O https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz

tar -xzf lab3-bundle.tar.gz

awk 'NF' data/*.tsv > cleaned.tsv

tr '\t' ',' < cleaned.tsv > cleaned.csv

ROW_COUNT=$(tail -n +2 cleaned.csv | wc -l)

echo "Number of data rows: $ROW_COUNT"

tar -czf converted-archive.tar.gz cleaned.csv
