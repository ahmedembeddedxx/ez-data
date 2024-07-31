from mrjob.job import MRJob
import sys

class MaxSongsPerDay(MRJob):
    def mapper(self, _, line):
        words = line.split(',')
        date = words[1]
        person = words[0]
        yield date, (person, len(words) - 2)

    def reducer(self, date, person_songs):
        max_songs = 0
        max_person = None
        for person, songs in person_songs:
            if songs > max_songs:
                max_songs = songs
                max_person = person
        yield date, (max_person, max_songs)

if __name__ == '__main__':
    MaxSongsPerDay.run()
