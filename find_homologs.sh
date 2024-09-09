#!/bin/bash

query="$1"
subject="$2"
output="$3"

blastn -query "$query" -subject "$subject" -task blastn-short -outfmt "6 qseqid sseqid evalue pident length qlen" -out blast_results.txt

awk '$4==100 && $5==$6' blast_results.txt > "$output"


num=$(wc -l < "$output")
echo "Number of perfect matches: $num"

rm blast_results.txt
