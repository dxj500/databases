require 'book_repository'

RSpec.describe BookRepository do

  def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
    connection.exec(seed_sql)
  end
  
  describe BookRepository do
    before(:each) do 
      reset_books_table 
    end
  
    # (your tests will go here).
    it "returns the first book" do
      repo = BookRepository.new
      books = repo.all

      expect(books[0].id).to eq '1'
      expect(books[0].title).to eq 'Nineteen Eighty-Four'
      expect(books[0].author_name).to eq 'George Orwell'
    end

    it "returns the third book" do
      repo = BookRepository.new
      books = repo.all

      expect(books[2].id).to eq '3'
      expect(books[2].title).to eq 'Emma'
      expect(books[2].author_name).to eq 'Jane Austen'
    end

    # it "returns all the book titles" do
    #   repo = BookRepository.new
    #   books = repo.all

    #   #expect(books.each{|book| book.title}).to eq []
    #   expect(books.all.title).to eq []
    # end


  end
end