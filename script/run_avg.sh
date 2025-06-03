#!/bin/bash
# Hadoop Streaming: Average Ratings
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
    -input /user/yourusername/movielens/ratings.csv \
    -output /user/yourusername/movielens/output/avg_ratings \
    -mapper movielens_mapreduce/mapper_avg.py \
    -reducer movielens_mapreduce/reducer_avg.py \
    -file movielens_mapreduce/mapper_avg.py \
    -file movielens_mapreduce/reducer_avg.py
