#!/bin/bash
# Hadoop Streaming: Average Ratings

cd ~/hadoop-3.4.1
bin/hdfs dfs -mkdir -p /movielens
bin/hdfs dfs -put -f ~/MovieLens_HadoopMapReduce-Pyhton/dataset/ratings.csv /movielens/
bin/hadoop jar share/hadoop/tools/lib/hadoop-streaming-*.jar \
    -input /movielens/ratings.csv \
    -output /movielens/output \
    -mapper ~/MovieLens_HadoopMapReduce-Pyhton/scripts/mapper_avg.py \
    -reducer ~/MovieLens_HadoopMapReduce-Pyhton/scripts/reducer_avg.py
bin/hdfs dfs -cat /movielens/output/part-*


# hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
#     -input /user/yourusername/movielens/ratings.csv \
#     -output /user/yourusername/movielens/output/avg_ratings \
#     -mapper movielens_mapreduce/mapper_avg.py \
#     -reducer movielens_mapreduce/reducer_avg.py \
#     -file movielens_mapreduce/mapper_avg.py \
#     -file movielens_mapreduce/reducer_avg.py
