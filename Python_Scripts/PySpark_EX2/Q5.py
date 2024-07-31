from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("Distinct Records") \
    .getOrCreate()

studata = spark.read.csv("citys.csv", sep=" ", header=True, inferSchema=True)

studata = studata.distinct()

studata.show()

print(f"Counts: {studata.count()}")


spark.stop()
