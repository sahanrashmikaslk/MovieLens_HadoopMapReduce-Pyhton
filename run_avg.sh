#!/usr/bin/env bash
# Hadoop Streaming : calculate average movie ratings
# WSL / Linux • Hadoop 3.4.1 pseudo-distributed

set -euo pipefail                # bail on first error

# ---------- configuration ----------
HADOOP_HOME=~/hadoop-3.4.1
INPUT_CSV=~/MovieLens_HadoopMapReduce-Pyhton/dataset/ratings.csv
MAPPER=~/MovieLens_HadoopMapReduce-Pyhton/scripts/mapper_avg.py
REDUCER=~/MovieLens_HadoopMapReduce-Pyhton/scripts/reducer_avg.py
HDFS_BASE=/movielens
OUTPUT_DIR=$HDFS_BASE/output       # will be removed each run
# -----------------------------------

cd "$HADOOP_HOME"

# Put (or overwrite) the CSV in HDFS
bin/hdfs dfs -mkdir -p "$HDFS_BASE"
bin/hdfs dfs -put -f "$INPUT_CSV"  "$HDFS_BASE/ratings.csv"

# *** remove any previous results so job won’t abort ***
bin/hdfs dfs -rm -r -f "$OUTPUT_DIR" 2>/dev/null || true

# Launch the streaming job
bin/hadoop jar share/hadoop/tools/lib/hadoop-streaming-*.jar \
  -files "$MAPPER","$REDUCER" \
  -input  "$HDFS_BASE/ratings.csv" \
  -output "$OUTPUT_DIR" \
  -mapper  "python3 $(basename "$MAPPER")" \
  -reducer "python3 $(basename "$REDUCER")"

# Show the results
echo -e "\n--- Average ratings ---"
bin/hdfs dfs -cat "$OUTPUT_DIR/part-*"











#!/bin/bash
# Hadoop Streaming: Average Ratings

# cd ~/hadoop-3.4.1
# bin/hdfs dfs -mkdir -p /movielens
# bin/hdfs dfs -put -f ~/MovieLens_HadoopMapReduce-Pyhton/dataset/ratings.csv /movielens/
# bin/hadoop jar share/hadoop/tools/lib/hadoop-streaming-*.jar \
#     -input /movielens/ratings.csv \
#     -output /movielens/output \
#     -mapper ~/MovieLens_HadoopMapReduce-Pyhton/scripts/mapper_avg.py \
#     -reducer ~/MovieLens_HadoopMapReduce-Pyhton/scripts/reducer_avg.py
# bin/hdfs dfs -cat /movielens/output/part-*


# hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
#     -input /user/yourusername/movielens/ratings.csv \
#     -output /user/yourusername/movielens/output/avg_ratings \
#     -mapper movielens_mapreduce/mapper_avg.py \
#     -reducer movielens_mapreduce/reducer_avg.py \
#     -file movielens_mapreduce/mapper_avg.py \
#     -file movielens_mapreduce/reducer_avg.py
