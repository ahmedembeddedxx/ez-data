from mrjob.job import MRJob
from mrjob.step import MRStep

class FindCoAuthors(MRJob):
    def mapper(self, _, line):
        if line != '' and line[1]=='@':
            line = line[2:]
            authors = line.split(',')
            for author, i in zip(authors, range(len(authors))):
                if author != '':
                    yield (author, list(authors[:i]+authors[i+1:]))


    def reducer(self, author, listedauthors):
        coauthors = []
        for lco in listedauthors:
            if lco not in coauthors:
                coauthors += lco
        yield (author, coauthors)


if __name__=='__main__':
    FindCoAuthors.run()

