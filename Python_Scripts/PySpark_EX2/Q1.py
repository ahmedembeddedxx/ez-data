from pyspark.sql import SparkSession
from pyspark.sql.functions import avg

spark = SparkSession.builder \
    .appName("Calculating Average Marks") \
    .getOrCreate()

marks_df = spark.read.csv("students.csv", header=True, inferSchema=True)

average_marks_df = marks_df.groupBy("Student").agg(avg("Marks"))

average_marks_df.show()
spark.stop()
