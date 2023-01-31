require 'book_repository'

def reset_books_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_books_table
  end

  # (your tests will go here).

  it 'returns the list of books' do
    repo = BookRepository.new
    books = repo.all

    expect(books.length).to eq 2 # =>  2
    expect(books[0].id).to eq ('1') # =>  1
    expect(books[0].title).to eq 'The Vinci Code'
    expect(books[0].author_name).to eq 'Dan Brown' # =>  'Dan Brown'
  end
end
