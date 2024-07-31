x = input('Enter Phrase: ')

from mrjob.job import MRJob

class UniqueWordCounter(MRJob):
    def mapper(self, _, line):
        i = line.split(',')
        if i[0]==x: 
            yield(i[0], i[1])
    
    def reducer(self, key, value):
        yield(key, list(value))
        
if __name__=='__main__':
    UniqueWordCounter.run()






