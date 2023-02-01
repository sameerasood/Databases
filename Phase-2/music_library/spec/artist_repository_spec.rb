require 'artist_repository'

RSpec.describe ArtistRepository do

  def reset_artists_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_artists_table
  end


  it 'returns the list of artists' do
    repo = ArtistRepository.new
    artists = repo.all

    expect(artists.length).to eq 2 # =>  2
    expect(artists.first.id).to eq ('1') # =>  1
    expect(artists.first.name).to eq 'Kate Perry' # =>  'Kate Perry'
  end

  it 'returns the first artist from the list' do
    repo = ArtistRepository.new
    artist = repo.find(1)
    expect(artist.name).to eq 'Kate Perry'
    expect(artist.genre).to eq 'Roar'
  end

  it 'returns the second artist from the list' do
    repo = ArtistRepository.new
    artist = repo.find(2)
    expect(artist.name).to eq 'Coldplay'
    expect(artist.genre).to eq 'Yellow'
  end

  it 'creates new album in the array'
    repo = ArtistRepository.new
    album = Album.new
    expect(album.title).to eq 'Trompe le Monde'
    expect(album.release_year).to eq 1991
    expect(album.artist_id).to eq 1
    repo.create(album)
    all_albums = repo.all
end