#!/usr/bin/env python3
import sys
from collections import defaultdict

counts = defaultdict(int)
for line in sys.stdin:
    line = line.strip()
    if not line:
        continue
    movie_id, count = line.split('\t')
    counts[movie_id] += int(count)

for movie_id, total in counts.items():
    print(f"{movie_id}\t{total}")
