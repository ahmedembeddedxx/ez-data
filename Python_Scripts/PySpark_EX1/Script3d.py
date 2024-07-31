from pyspark import SparkContext, SparkConf

def get_names(data):
    return data.map(lambda line: line.split(",")[0])


conf = SparkConf().setAppName("SingleListOfEmployees").setMaster("local")
sc = SparkContext(conf=conf)

contractors = sc.textFile("Contractors.txt")
employees = sc.textFile("Employees.txt")


contractors = get_names(contractors).collect()
employees = get_names(employees).collect()

all = contractors + employees

all = sc.parallelize(all)

all.saveAsTextFile("output")

sc.stop()
