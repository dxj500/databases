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


  it "returns two albums" do
    repo = AlbumRepository.new
    albums = repo.all

    expect(albums.length).to eq 2 # =>  2
    expect(albums.first.title).to eq "The Colour and the Shape" # => 'The Colour and the Shape'
    expect(albums.first.release_year).to eq '1997' # => 1997
    expect(albums.first.artist_id).to eq '1' # => 1
  end

  it "returns the album the colour and the shape" do
    repo = AlbumRepository.new
    album = repo.find(1)

    expect(album.title).to eq 'The Colour and the Shape'
    expect(album.release_year).to eq '1997'
    expect(album.artist_id).to eq '1'

  end

  it "returns the album chloe..." do
    repo = AlbumRepository.new
    album = repo.find(2)

    expect(album.title).to eq 'Chloe and the Next 20th Century'
    expect(album.release_year).to eq '2022'
    expect(album.artist_id).to eq '2'
  end

  it "inserts a new album for artist 2" do
    repo = AlbumRepository.new
    new_album = Album.new

    new_album.title = 'Pure Comedy'
    new_album.release_year = '2017'
    new_album.artist_id = '2'
    
    repo.create(new_album)

    all_albums = repo.all
    #•••••••••••••••
    p all_albums

    expect(all_albums).to include(
      have_attributes(
        title: new_album.title,
        release_year: '2017'
      )
    )
  end

end