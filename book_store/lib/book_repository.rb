require_relative 'book'

class BookRepository

  def all
    # Executes the SQL query:
    # SELECT id, title, author_name FROM books;
    books = []
    sql = 'SELECT id, title, author_name FROM books;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |obj|
      book = Book.new

      book.id = obj['id']
      book.title = obj['title']
      book.author_name = obj['author_name']

      books << book
    end

    return books
  end
end