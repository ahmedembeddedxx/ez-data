from pyspark import SparkContext, SparkConf

conf = SparkConf().setAppName("ProductSalesAmount").setMaster("local")
sc = SparkContext(conf=conf)

data = sc.textFile("sales.txt")

products_and_price = data.map(lambda line: line.split(","))
products_and_price = products_and_price.map(lambda x: (x[0], float(x[1])))
sum_by_product = products_and_price.reduceByKey(lambda x, y: x + y)

sum_by_product.saveAsTextFile("output")

sc.stop()
