from mrjob.job import MRJob
import sys
import re

class SongsMoreThan5(MRJob):
    def mapper(self, _, line):
        words = line.split(',')
        if (len(words) - 2) >= 5:
            yield (words[0], len(words)-2)


        
if __name__=='__main__':
    SongsMoreThan5.run()