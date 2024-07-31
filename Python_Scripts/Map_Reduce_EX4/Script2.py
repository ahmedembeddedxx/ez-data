from mrjob.job import MRJob
from mrjob.step import MRStep

str = ""
class PaperNamePerYear(MRJob):
    def mapper(self, _, line):
        if line != '' and line[1]=='*':
            global str
            str = line[2:]
        if line != '' and line[1]=='t':
            yield (line[2:], str)


    def reducer(self, key, values):
        yield (key, list(values))



if __name__=='__main__':
    PaperNamePerYear.run()

