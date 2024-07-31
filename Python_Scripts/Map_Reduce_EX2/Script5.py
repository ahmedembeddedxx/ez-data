from mrjob.job import MRJob

class SongsCounter(MRJob):
    def mapper(self, _, line):
        for i, n in zip(line.split(','), range(len(line))):
            if(n>=2):
                yield(i, 1)
    
    def reducer(self, word, counts):
        yield(word, sum(counts))
        
if __name__=='__main__':
    SongsCounter.run()