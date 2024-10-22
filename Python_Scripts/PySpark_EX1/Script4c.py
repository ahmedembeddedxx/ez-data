from pyspark import SparkContext, SparkConf

conf = SparkConf().setAppName("RevenueGenerated").setMaster("local")
sc = SparkContext(conf=conf)

data = sc.textFile("products.txt")

products = data.map(lambda line: line.split(","))
products = products.map(lambda x: (x[0], float(x[2])))
sum = products.reduceByKey(lambda x, y: x + y)

products = sum.sortBy(lambda x: x[1], False).take(5)

products = sc.parallelize(products)

products.saveAsTextFile("output")

sc.stop()
