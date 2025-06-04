#!/usr/bin/env python3
import sys
from collections import defaultdict

ratings = defaultdict(list)
for line in sys.stdin:
    line = line.strip()
    if not line:
        continue
    movie_id, rating = line.split('\t')
    ratings[movie_id].append(float(rating))

for movie_id, vals in ratings.items():
    avg = sum(vals) / len(vals)
    print(f"{movie_id}\t{avg:.2f}")
