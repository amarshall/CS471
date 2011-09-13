#!/bin/bash

echo "@author J. Andrew Marshall <jmarsha6@binghamton.edu>" > $1.txt
for filename in $(ls $1/*.txt $1/*.diff); do
  echo -e "\n"
  echo "=== $filename ==="
  echo ""
  cat "$filename"
done >> $1.txt
