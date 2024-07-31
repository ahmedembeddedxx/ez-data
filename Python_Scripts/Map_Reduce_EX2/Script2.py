from mrjob.job import MRJob
import sys
import re

class NoOfSongs(MRJob):
    def mapper(self, _, line):
        words = line.split(',')
        yield([words[0], words[1]], (len(words) - 2))


        
if __name__=='__main__':
    NoOfSongs.run()

