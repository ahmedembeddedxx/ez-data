from pyspark import SparkContext, SparkConf

conf = SparkConf().setAppName("DistinctIndivisuals").setMaster("local")
sc = SparkContext(conf=conf)

contractors = sc.textFile("Contractors.txt")
employees = sc.textFile("Employees.txt")

def get_individuals(data):
    return data.map(lambda line: line.split(",")[0]).distinct()

union_people = get_individuals(contractors).union(get_individuals(employees))
union_people = union_people.distinct()
union_people.saveAsTextFile("output")


sc.stop()
