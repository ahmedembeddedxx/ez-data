from pyspark import SparkContext, SparkConf

conf = SparkConf().setAppName("UppercaseContractor").setMaster("local")
sc = SparkContext(conf=conf)

contractors = sc.textFile("Contractors.txt")

contractor_and_department = contractors.map(lambda line: line.split(","))
contractor_and_department = contractors.map(lambda x: x.upper())


contractor_and_department.saveAsTextFile("output")

sc.stop()
