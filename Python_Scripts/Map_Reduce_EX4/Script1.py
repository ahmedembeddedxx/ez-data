from mrjob.job import MRJob
from mrjob.step import MRStep


class PaperPerDecade(MRJob):
    def mapper(self, _, line):
        if line != '' and line[1]=='t':
            if int(line[2:5]) > 0:          
                yield(line[2:5]+"0s", 1)
        
    def reducer(self, key, values):
        yield(key, sum(values))

if __name__=='__main__':
    PaperPerDecade.run()

