#!/usr/bin/env python3
import sys
for line in sys.stdin:
    line = line.strip()
    if line.startswith("userId"):
        continue
    parts = line.split(',')
    if len(parts) < 2:
        continue
    movie_id = parts[1]
    print(f"{movie_id}\t1")
