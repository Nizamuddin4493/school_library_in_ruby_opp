require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'create_book'
require_relative 'create_student'
require_relative 'create_teacher'

class App
  attr_accessor :persons, :books, :rentals, :create_book

  def initialize
    @persons = []
    @books = []
    @rentals = []
    @create_book = CreateBook.new
    @create_student = CreateStudent.new
    @create_teacher = CreateTeacher.new
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
      book = @create_book.new_book
      @books << book
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
      student = @create_student.new_student
      @persons << student
    when '2'
      teacher = @create_teacher.new_teacher
      @persons << teacher
    else
      puts 'Input not valid. Please enter a valid input (1) or (2)'
    end
  end

  def create_a_rental
    puts 'Creating a rental ... '

    puts 'Select a book from the following list by a number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title} Author: #{book.author}" }
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by a number (not from id)'
    @persons.each_with_index { |person, index| puts "#{index}) ID:#{person.id} Name: #{person.name} Age:#{person.age}" }
    person_index = gets.chomp.to_i

    puts 'Date: yyyy-mm-dd'
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
