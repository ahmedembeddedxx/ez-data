from pyspark.sql import SparkSession
from pyspark.sql.functions import col
from pyspark.sql.functions import min, max

spark = SparkSession.builder \
    .appName("Ordered Grades") \
    .getOrCreate()

studata = spark.read.csv("citys.csv", sep=" ", header=True, inferSchema=True)

studata = studata.groupBy("Course").agg(min(col("Grade")).alias("MaxGrade"), max(col("Grade")).alias("MinGrade"))

studata.show()

spark.stop()