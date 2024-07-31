from mrjob.job import MRJob
import sys
import re

class SumOfAllSongs(MRJob):
    def mapper(self, _, line):
        words = line.split(',')
        yield(words[0], (len(words) - 2))
    
    def reducer(self, word, count):
        yield(word, sum(count))

    def combiner(self, key, value):
        yield(None, sum(value))
    
        
if __name__=='__main__':
    SumOfAllSongs.run()