from mrjob.job import MRJob

class WordCounter(MRJob):
    def mapper(self, _, line):
        for i in line.split(' '):
            yield(i.lower(), 1)
    
    def reducer(self, word, counts):
        yield(word, sum(counts))
        
if __name__=='__main__':
    WordCounter.run()