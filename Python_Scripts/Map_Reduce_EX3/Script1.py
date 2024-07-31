
from mrjob.job import MRJob
import sys
import string

print("Enter Phrase: ")
x = sys.stdin.readline().strip()

class UniqueWordCounter(MRJob):
    def mapper(self, _, line):
        i = line.split(',')
        if i[0]==x: 
            yield(i[0], i[1])
    
    def reducer(self, key, value):
        yield(key, list(value))
        
if __name__=='__main__':
    UniqueWordCounter.run()