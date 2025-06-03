#!/usr/bin/env python3
import sys
for line in sys.stdin:
    line = line.strip()
    if line.startswith("userId"):
        continue
    parts = line.split(',')
    if len(parts) < 3:
        continue
    movie_id, rating = parts[1], parts[2]
    print(f"{movie_id}\t{rating}")