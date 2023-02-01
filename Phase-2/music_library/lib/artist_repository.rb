require_relative './artist'
class ArtistRepository
    def all
      sql = 'SELECT id, name, genre FROM artists;'
      result_set = DatabaseConnection.exec_params(sql,[])

      artists = []

      result_set.each do |record|
        artist = Artist.new
        artist.id = record['id']
        artist.name = record['name']
        artist.genre = record['genre']

        artists.push(artist)
      end
      return artists
    end

    def find(id)
      sql = 'SELECT name, genre FROM artists where id = $1'
      sql_params = [id]
      result = DatabaseConnection.exec_params(sql, sql_params)

      record = result[0]

      artist = Artist.new
      artist.name = record['name']
      artist.genre = record['genre']

      return artist
    end

    def create(album)
    end
end