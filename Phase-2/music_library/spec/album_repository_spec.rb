require 'album_repository'

RSpec.describe AlbumRepository do

  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_albums_table
  end

it 'gets all albums' do
repo = AlbumRepository.new

albums = repo.all
expect(albums.length).to eq 2 # =>  2
expect(albums.first.title).to eq 'Dark Horse' # =>  'Dark Horse'
expect(albums.first.release_year).to eq '2013' # =>  '2013'
end

it 'returns the first album from the list' do
    repo = AlbumRepository.new
    album = repo.find(2)
    expect(album.title).to eq 'Yellow'
    expect(album.release_year).to eq '2000'
end

  it 'returns the first artist from the list' do
    repo = AlbumRepository.new
    album = repo.find(1)
    expect(album.title).to eq 'Dark Horse'
    expect(album.release_year).to eq '2013'
  end

  it 'creates new album in the array' do
    repository = AlbumRepository.new

    new_album = Album.new
    new_album.title = 'Trompe le Monde'
    new_album.release_year = "1991"
    new_album.artist_id = "1"

    repository.create(new_album)
    all_albums = repository.all

    expect(all_albums).to include(
        have_attributes(
            title: new_album.title,
            release_year: "1991",
            artist_id: "1"
        )
    )

  end
end