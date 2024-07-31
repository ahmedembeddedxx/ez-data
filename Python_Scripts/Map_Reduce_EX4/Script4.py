from mrjob.job import MRJob
from mrjob.step import MRStep

str = ""
class FindPaperWithoutVenue(MRJob):
    def mapper(self, _, line):
        if line != '' and line[1]=='*':
            global str
            str = line[2:]
        if line != '' and line[1]=='c':
            if line[2:] == '':
                yield (1, str)

    def reducer(self, key, values):
        yield (key, list(values))


if __name__=='__main__':
    FindPaperWithoutVenue.run()

