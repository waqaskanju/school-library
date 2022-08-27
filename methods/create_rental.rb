require './rental'

def create_rental(book, person)
  print 'Date: '
  date = gets.chomp
  rental = Rental.new(date, book, person)
  book.add_rental(rental)
  person.add_rental(rental)
  puts 'Rental created successfully!'
  sleep(0.8)
end
