from mrjob.job import MRJob
import sys
import re

class AvgSongsPlayedPerDay(MRJob):
    def mapper(self, _, line):
        words = line.split(',')
        date = words[1]
        songs_played = len(words) - 2
        yield (date, (songs_played, 1))

    def reducer(self, key, values):
        total_songs = 0
        total_days = 0
        for songs, days in values:
            total_songs += songs
            total_days += days
        yield (key, total_songs / total_days)

if __name__ == '__main__':
    AvgSongsPlayedPerDay.run()
