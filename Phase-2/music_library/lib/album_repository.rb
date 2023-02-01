require_relative './album'

class AlbumRepository
  def all
    sql = 'SELECT title, release_year, artist_id FROM albums;'
    result = DatabaseConnection.exec_params(sql,[])

    albums = []

    result.each do |record|
        album = Album.new
        album.title = record['title']
        album.release_year = record['release_year']
        album.artist_id = record['artist_id']

        albums.push(album)
    end
    return albums
  end

  def find(id)
    sql = 'SELECT title, release_year, artist_id FROM albums WHERE id = $1;'
    sql_params = [id]
    result = DatabaseConnection.exec_params(sql, sql_params)

    record = result[0]

    album = Album.new
    album.title = record['title']
    album.release_year = record['release_year']
    album.artist_id = record['artist_id']

    return album
  end

  def create(album)
    sql = 'INSERT INTO albums(title, release_year, artist_id) VALUES($1, $2, $3);'
    sql_params = [album.title, album.release_year, album.artist_id]
    result = DatabaseConnection.exec_params(sql, sql_params)
    return nil
  end
end