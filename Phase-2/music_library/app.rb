require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/album_repository'

class Application

# Perform a SQL query on the database and get the result set.
  def initialize(music_library, io, album_repository, artist_repository)
    DatabaseConnection.connect('music_library')
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
  puts "Welcome to the music library manager!"
  puts "What would you like
  1 - List all albums
  2 - List all artists"

  puts "Enter your choice"
  choice = gets.chomp

  if choice == '1'
     albums = @album_repository.all
     puts "Here is the list of albums:"
       count = 1
      albums.each do |record|
       puts "* #{count} #{record.title}"
        count += 1
      end

    else choice == 2
      artists = @artist_repository.all
      puts "Here is the list of albums:"
      count = 1
      artists.each do |record|
       puts "* #{count} #{record.name}"
        count += 1
      end
  end
  end

  if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end
end
