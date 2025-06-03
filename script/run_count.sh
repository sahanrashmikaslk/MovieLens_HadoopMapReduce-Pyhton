#!/bin/bash
# Hadoop Streaming: Rating Counts
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
    -input /user/yourusername/movielens/ratings.csv \
    -output /user/yourusername/movielens/output/rating_counts \
    -mapper movielens_mapreduce/mapper_count.py \
    -reducer movielens_mapreduce/reducer_count.py \
    -file movielens_mapreduce/mapper_count.py \
    -file movielens_mapreduce/reducer_count.py
