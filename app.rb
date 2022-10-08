require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :persons, :books, :rentals

  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def run
    puts 'Welcome to OPP School Library App!'
    loop do
      main_menu

      print 'Enter your option: '
      input = gets.chomp

      if input == '7'
        puts 'Thanks for using the app'
        break
      end

      options(input)
    end
  end

  def main_menu
    puts ''
    puts '-------------------------------------------'
    puts 'Please choose an option by enter a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def options(input)
    case input
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_a_person
    when '4'
      create_a_book
    when '5'
      create_a_rental
    when '6'
      list_all_rentals_by_person_id
    else
      puts 'Please choose a valid option'
    end
  end

  def list_all_books
    if @books.empty?
      puts 'Book list is empty'
    else
      puts 'List of all Books'
      @books.each { |book| puts "Title: #{book.title} Author: #{book.author}" }
    end
  end

  def list_all_people
    if @persons.empty?
      puts 'Person list is empty'
    else
      puts 'List of all People'
      @persons.each { |person| puts "[#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age}" }
    end
  end

  def create_a_person
    puts 'Creating a Person'
    print 'Do you want to create a student(1) or a teacher(2)? [Enter the number]: '
    input = gets.chomp

    case input
    when '1'
      create_a_student
    when '2'
      create_a_teacher
    else
      puts 'Input not valid. Please enter a valid input (1) or (2)'
    end
  end

  def create_a_student
    puts 'Creating a student ...'
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase
    parent_permission = parent_permission == 'Y'

    student = Student.new(age, name, parent_permission: parent_permission)
    persons.push(student)

    puts "Student #{name} created successfully"
  end

  def create_a_teacher
    puts 'Creating a teacher ...'
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    persons.push(teacher)

    puts "Teacher #{name} created successfully"
  end

  def create_a_book
    puts 'Creating a book ... '
    print 'Book Title: '
    title = gets.chomp

    print 'Book Author: '
    author = gets.chomp

    book = Book.new(title, author)
    books.push(book)

    puts "Book #{title} created successfully"
  end

  def create_a_rental
    puts 'Creating a rental ... '

    puts 'Select a book from the following list by a number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title} Author: #{book.author}" }
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by a number (not from id)'
    @persons.each_with_index { |person, index| puts "#{index}) ID:#{person.id} Name: #{person.name} Age:#{person.age}" }
    person_index = gets.chomp.to_i

    print 'Date: yyyy-mm-dd'
    date = gets.chomp

    rental = Rental.new(date, @persons[person_index], @books[book_index])
    @rentals.push(rental)

    puts 'Rental created successfully'
  end

  def list_all_rentals_by_person_id
    puts 'List of all rentals by person id'

    puts 'Select a person from the following list by ID'
    @persons.each { |person| puts "ID: #{person.id} Name: #{person.name} Age:#{person.age}" }
    person_id = gets.chomp

    puts 'Rentals: '

    @rentals.each do |rental|
      if rental.person.id.to_i == person_id.to_i
        puts "Date: #{rental.date} - Book: #{rental.book.title} - Author: #{rental.book.author}"
      end
    end
  end
end
