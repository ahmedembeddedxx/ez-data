from pyspark.sql import SparkSession
from pyspark.sql.functions import col, udf, avg
from pyspark.sql.types import IntegerType


spark = SparkSession.builder \
    .appName("Avg. GPA") \
    .getOrCreate()

studata = spark.read.csv("citys.csv", sep=" ", header=True, inferSchema=True)

def getGPA(Grade):
    grades_dict = {'A':4, 'B':3, 'C':2, 'D':1, 'F':0}
    return grades_dict[Grade]


getGPA_func = udf(getGPA, IntegerType())

studata = studata.withColumn("GPA", getGPA_func(col("Grade")))

studata = studata.groupBy(col("Course")).agg(avg(col("GPA")).alias("Avg. GPA"))

studata.show()

spark.stop()