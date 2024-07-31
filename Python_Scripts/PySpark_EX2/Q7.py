from pyspark.sql import SparkSession
from pyspark.sql.functions import col, udf, avg
from pyspark.sql.types import IntegerType


spark = SparkSession.builder \
    .appName("GPA Calculator") \
    .getOrCreate()

studata = spark.read.csv("citys.csv", sep=" ", header=True, inferSchema=True)

def getGPA(Grade):
    grades_dict = {'A':4, 'B':3, 'C':2, 'D':1, 'F':0}
    return grades_dict[Grade]


getGPA_func = udf(getGPA, IntegerType())

studata = studata.withColumn("GPA", getGPA_func(col("Grade")))

studata = studata.select(studata.Roll, studata.GPA)

studata = studata.groupBy(col("Roll")).agg(avg(col("GPA")))

studata.show()

spark.stop()