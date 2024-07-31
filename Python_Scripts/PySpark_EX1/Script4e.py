from pyspark import SparkContext, SparkConf

conf = SparkConf().setAppName("RevenueGenerated").setMaster("local")
sc = SparkContext(conf=conf)

# Calculate the total revenue generated from products with a quantity sold greater than 100.

data = sc.textFile("products.txt")

products = data.map(lambda line: line.split(","))
products = products.map(lambda x: (x[0], float(x[1])))
sum = products.reduceByKey(lambda x, y: x + y)

products = sum.filter(lambda x: x[1] > 100)

products = sc.parallelize(products)

products.saveAsTextFile("output")

sc.stop()
