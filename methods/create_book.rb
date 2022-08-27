require './book'

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  book = Book.new(title, author)
  puts 'Book created successfully!'
  sleep(0.8)
  book
end
