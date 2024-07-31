from mrjob.job import MRJob
import sys

class UniqueWordCounter(MRJob):
    def mapper(self, _, line):
        splits  = line.split(' ')

        for i in range(len(splits)):
            for j in range(len(splits)):
                if i==j-1:
                    yield(splits[i], splits[j]), 1
                else:
                    yield(splits[i], splits[j]), 0
    
    def reducer(self, word, counts):
        yield word, sum(counts)
        
if __name__=='__main__':
    UniqueWordCounter.run()


