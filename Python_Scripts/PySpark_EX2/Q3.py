from pyspark.sql import SparkSession
from pyspark.sql.functions import col
from pyspark.sql.functions import substring

spark = SparkSession.builder \
    .appName("Students in year 1995-2018") \
    .getOrCreate()

studata = spark.read.csv("citys.csv", sep=" ", header=True, inferSchema=True)

year = substring(col("Roll"), 2, 2).cast("int")

studata = studata.filter(~year.between(19,94))

studata.show()

spark.stop()
