# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/album_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library_test')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, title FROM albums;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
result.each do |record|
  p record.values
end
album_repository = AlbumRepository.new
# Get the album with artist id 2
album = album_repository.find(2)

puts album.id
puts album.title
puts album.release_year
