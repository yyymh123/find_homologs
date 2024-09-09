#!/bin/bash

query=$1
subject=$2
output=$3

tblastn -query "$query" -subject "$subject" -outfmt "6 qseqid sseqid pident length qlen" -out blast_results.txt

awk '{ if ($3 >= 30 && $4 >= 0.9 * $5) print $0 }' blast_results.txt > "$output"

num_matches=$(wc -l < "$output")
echo "Number of matches: $num_matches"

