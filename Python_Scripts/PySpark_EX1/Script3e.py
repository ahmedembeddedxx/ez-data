from pyspark import SparkContext, SparkConf

conf = SparkConf().setAppName("SalesIntersection").setMaster("local")
sc = SparkContext(conf=conf)

employees = sc.textFile("Employees.txt")
contractors = sc.textFile("Contractors.txt")

employees = employees.map(lambda line: line.split(","))
employees = employees.filter(lambda x: "Sales" in x[1])
employees = employees.map(lambda x: x[0])

contractors = contractors.map(lambda line: line.split(","))
contractors = contractors.filter(lambda x: "Sales" in x[1])
contractors = contractors.map(lambda x: x[0])

all = employees.intersection(contractors)


all.saveAsTextFile("output")

sc.stop()
