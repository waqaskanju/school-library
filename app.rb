require './methods/create_person'
require './methods/create_book'
require './methods/create_rental'

class App
  def initialize
    @students = []
    @teachers = []
    @books = []
  end

  def display_options
    print "
[1] List all books
[2] List all people
[3] Add a person
[4] Add a book
[5] Add a rental
[6] List all rentals for a given person id
[7] Exit\n
Select an option by typing its number: "
  end

  def main
    loop do
      display_options
      option = gets.chomp.to_i
      if (1..7).include?(option)
        run(option)
      else
        puts "Sorry, this option doesn't exist.\n"
        sleep(0.8)
      end
      break if option == 7
    end
    puts 'Exiting...'
  end

  def run(option)
    case option
    when 1
      list_books
    when 2
      list_people
    when 3
      add_person
    when 4
      add_book
    when 5
      add_rental
    when 6
      list_rental
    end
  end

  def list_books
    puts 'Booklist: '
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    puts 'Teachers'
    @teachers.each { |teacher| puts "Name: #{teacher.name}, Age: #{teacher.age}, ID: #{teacher.id}" }
    puts 'Students'
    @students.each { |student| puts "Name: #{student.name}, Age: #{student.age}, ID: #{student.id}" }
  end

  def add_person
    print 'Do you want to add a student[1], a teacher[2] or return [0]? (Input the number): '
    option = gets.chomp.to_i
    case option
    when 0
      nil
    when 1
      @students.push(create_person('Student')) # imported
    when 2
      @teachers.push(create_person('Teacher')) # imported
    else
      puts 'Please insert a valid option.'
      sleep(0.8)
      add_person
    end
  end

  def add_book
    @books.push(create_book) # imported
  end

  def add_rental
    if @books[0]
      puts 'Select a book from the following list by its number:'
      @books.each { |book| puts "[#{@books.index(book)}] Title: #{book.title}, Author: #{book.author}" }
      book = gets.chomp.to_i
      if @students[0] || @teachers[0]
        puts 'Select a person from the following list by number.'
        people = @teachers + @students
        people.each do |person|
          puts "[#{people.index(person)}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
        end
        person = gets.chomp.to_i
        create_rental(@books[book], people[person]) # imported
      else
        puts 'There is no one to rent this book.'
        sleep(0.8)
      end
    else
      puts 'The booklist is currently empty.'
      sleep(0.8)
    end
  end

  def list_rental
    print "Insert the person's ID: "
    id = gets.chomp.to_i
    id_doesnt_exist = true
    people = @teachers + @students
    people.each do |person|
      next unless person.id == id

      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
      id_doesnt_exist = false
      break
    end
    return unless id_doesnt_exist

    puts "This ID doesn't exist."
    sleep(0.10)
  end
end

app = App.new
app.main
