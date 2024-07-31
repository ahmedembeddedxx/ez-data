from mrjob.job import MRJob

class FirstLetterCounter(MRJob):
    def mapper(self, _, line):
        for word in line.split(' '):
            yield(word[0], 1)
    
    def reducer(self, letter, counts):
        yield(letter, sum(counts))
        
if __name__=='__main__':
    FirstLetterCounter.run()