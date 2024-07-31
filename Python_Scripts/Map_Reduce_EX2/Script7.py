from mrjob.job import MRJob
import sys
import re

class MaxSongsPlayedBy(MRJob):
    def mapper(self, _, line):
        words = line.split(',')
        yield(words[0], (len(words) - 2))

    def combiner(self, key, values):
        yield('Max:', sum(values))
        

    def reducer(self, key, values):
        yield('Max:', max(values))


if __name__=='__main__':
    MaxSongsPlayedBy.run()

