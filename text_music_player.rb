require './input_functions'

module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

# Uh oh - the following is a global variable
# What do we say about using global variables in the lecture notes?
$genre_names = %w[Null Pop Classic Jazz Rock]

class Track
  attr_accessor :name, :location

  def initialize(name, location)
    @name = name
    @location = location
  end
end

class Album
  attr_accessor :title, :artist, :genre, :tracks

  def initialize(title, artist, genre, tracks)
    @title = title
    @artist = artist
    @genre = genre
    @tracks = tracks
  end
end

# Reads in and returns a single track from the terminal

def read_track
  # Complete the missing code
  name = read_string('Please enter a track name')
  location = read_string('Please enter a track location')
  track = Track.new(name, location)
  track
end

# Reads in and returns an array of multiple tracks from the given file

def read_tracks
  count = read_integer_in_range('Enter track count: ', 0, 15)
  tracks = []
  i = 0
  # Put a while loop here which increments an index to read the tracks
  while i < count
    track = read_track
    # adds read track to tracks array?
    tracks << track
    i += 1
  end
  # Complete the missing code
  tracks
end

# Display the genre names in a
# numbered list and ask the user to select one
def read_genre
  # Complete the missing code
  $genre_names.length.times do |i|
    puts i.to_s + ' ' + $genre_names[i]
  end
  # Complete the missing code
end

# Reads in and returns a single album from the terminal, with all its tracks
def read_album
  # Complete the missing code
  album_title = read_string('Please enter an album title.')
  album_artist = read_string('Please enter the albums artist')
  read_genre
  album_genre = read_integer_in_range('Please select an album genre', 0, 4)
  tracks = read_tracks
  album = Album.new(album_title, album_artist, album_genre, tracks)
  album
end

# Takes an array of tracks and prints them to the terminal
def print_track(album)
  puts('Track title is: ' + album.name)
  puts('Track file location is: ' + album.location.to_s)
end

def print_tracks(album)
  # Complete the missing code
  count = album.tracks.length
  puts count
  album.tracks.length.times do |i|
    print_track(album.tracks[i])
  end
end

# Takes a single album and prints it to the terminal
def print_album(album)
  # Complete the missing code
  puts('Album title is: ' + album.title.to_s)
  puts('Album artist is: ' + album.artist.to_s)
  puts('Album genre is: ' + album.genre.to_s)
  print_tracks(album)
end

# Reads in an array of albums from a file and then prints all the albums in the
# array to the terminal
def main
  puts 'Welcome to the music player'
  album = read_album
  print_album(album)
end

main
