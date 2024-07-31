from mrjob.job import MRJob

class Length5Counter(MRJob):
    def mapper(self, _, line):
        for i in line.split(' '):
            if len(i) == 5:
                yield(i, 1)
    
    def reducer(self, word, counts):
        yield(word, sum(counts))
        
if __name__=='__main__':
    Length5Counter.run()