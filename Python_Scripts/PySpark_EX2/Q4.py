from pyspark.sql import SparkSession
from pyspark.sql.functions import col
from pyspark.sql.functions import substring

spark = SparkSession.builder \
    .appName("Students in each city") \
    .getOrCreate()

studata = spark.read.csv("citys.csv", sep=" ", header=True, inferSchema=True)

city = substring(col("Roll"), 1, 1).alias("City")


studata = studata.groupBy(city).count()


studata.show()

spark.stop()
