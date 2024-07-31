from pyspark.sql import SparkSession
from pyspark.sql.functions import col
from pyspark.sql.functions import count

spark = SparkSession.builder \
    .appName("Counting Lahore Students") \
    .getOrCreate()

studata = spark.read.csv("citys.csv", sep=" ", header=True, inferSchema=True)

studata = studata.filter(col("Roll").startswith('L'))

studata.show()
print(f"Counts={studata.count()}")

spark.stop()
