from pyspark import SparkContext, SparkConf

conf = SparkConf().setAppName("EngineeringEmployees").setMaster("local")
sc = SparkContext(conf=conf)

employees = sc.textFile("Employees.txt")

employee_and_department = employees.map(lambda line: line.split(","))
employee_and_department = employee_and_department.filter(lambda x: "Engineering" in x[1])
employee_and_department = employee_and_department.map(lambda x: x[0])

employee_and_department.saveAsTextFile("output")

sc.stop()
