from pyspark import SparkContext, SparkConf

conf = SparkConf().setAppName("AvgRevenueGenerated").setMaster("local")
sc = SparkContext(conf=conf)

data = sc.textFile("products.txt")

products = data.map(lambda line: line.split(","))
products = products.map(lambda x: (x[0], (float(x[1]), 1)))
sum = products.reduceByKey(lambda x, y: (x[0] + y[0], x[1] + y[1]))

avg = sum.map(lambda x: (x[0], x[1][0] / x[1][1]))


avg.saveAsTextFile("output")

sc.stop()
