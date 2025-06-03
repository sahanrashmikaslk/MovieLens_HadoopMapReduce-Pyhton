# MovieLens MapReduce Analysis (Python)

## Objective
Analyze the MovieLens dataset using Hadoop Streaming with Python to:
1. Compute the average rating per movie.
2. Identify the most rated movies.

## Files
- `mapper_avg.py`, `reducer_avg.py` – Average rating per movie.
- `mapper_count.py`, `reducer_count.py` – Rating count per movie.
- `scripts/run_avg.sh`, `scripts/run_count.sh` – Hadoop execution scripts.

## Setup
1. Ensure Hadoop is installed and configured.
2. Upload `ratings.csv` into HDFS:
```bash
hadoop fs -mkdir -p /user/yourusername/movielens
hadoop fs -put /path/to/ratings.csv /user/yourusername/movielens/
