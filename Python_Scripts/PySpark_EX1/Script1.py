from pyspark import SparkContext, SparkConf

conf = SparkConf().setAppName("TransactionsCalculator").setMaster("local")
sc = SparkContext(conf=conf)

data = sc.textFile("transaction.txt")

transactions_2023 = data.map(lambda line: line.split(",")).filter(lambda x: x[2].startswith("2023"))
tran_amount = transactions_2023.map(lambda x: int(x[1]))
trans_amount_sum = tran_amount.reduce(lambda x, y: x + y)

sc.stop()

print(f"Total Transaction Amount in 2023: {trans_amount_sum}")