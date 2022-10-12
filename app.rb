require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'create_book'
require_relative 'create_student'
require_relative 'create_teacher'
require 'json'
require 'pry'

class App
  attr_accessor :persons, :books, :rentals, :create_book

  def initialize
    @persons =  []
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
      json = JSON.generate(book)
      @books << json
      File.write('books.json', @books)
    when '5'
      # create_a_rental
      rental = create_a_rental
      json = JSON.generate(rental)
      @rentals << json
      File.write('rentals.json', @rentals)
    when '6'
      list_all_rentals_by_person_id
    else
      puts 'Please choose a valid option'
    end
  end

  def list_all_books
    bookData = "books.json"
    if File.exist?(bookData) && File.read(bookData) != ''
      @books = JSON.parse(File.read(bookData))
    end
    if @books.empty?
      puts 'Book list is empty'
    else
      puts 'List of all Books'
      @books.each do |book| 
        book = JSON.parse(book, create_additions: true)
        puts "Title: #{book.title} Author: #{book.author}" 
      end
    end
  end

  def list_all_people
    @persons = JSON.parse(File.read('persons.json')) if File.exists?('persons.json')
    if @persons.empty?
      puts 'Person list is empty'
    else
    puts 'List of all People'
      @persons.each  do |person|
        person = JSON.parse(person, create_additions: true)
        puts "[#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
      end 
    end
  end

  def create_a_person
    puts 'Creating a Person'
    print 'Do you want to create a student(1) or a teacher(2)? [Enter the number]: '
    input = gets.chomp

    case input
    when '1'
      student = @create_student.new_student
      json = JSON.generate(student)
      @persons << json
      File.write('persons.json', @persons)
    when '2'
      teacher = @create_teacher.new_teacher
      json = JSON.generate(teacher)
      @persons << json
      File.write('persons.json', @persons)
    else
      puts 'Input not valid. Please enter a valid input (1) or (2)'
    end
  end

  def create_a_rental
    puts 'Creating a rental ... '

    puts 'Select a book from the following list by a number'
    @books.each_with_index do |book, index| 
      book = JSON.parse(book, create_additions: true)
      puts "#{index}) Title: #{book.title} Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by a number (not from id)'
    @persons.each_with_index  do |person, index|
      person = JSON.parse(person, create_additions: true)
      puts "#{index}) ID:#{person.id} Name: #{person.name} Age:#{person.age}"
    end 
    
    person_index = gets.chomp.to_i

    puts 'Date: yyyy-mm-dd'
    date = gets.chomp

    rental = Rental.new(date, @persons[person_index], @books[book_index])
    puts 'Rental created successfully'
    rental
  end

  def list_all_rentals_by_person_id
    puts 'List of all rentals by person id'

    puts 'Select a person from the following list by ID'
    # list_all_people
    puts 'List of all People'
      person_data = File.open('persons.json', "r")
      # @persons = JSON.parse(person_data)
      person_data.each  do |person|
        puts person[1]
        # person = JSON.parse(person, create_additions: true)
        # puts "[#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
      end 
    person_id = gets.chomp

    puts 'Rentals: '
    rentalData = "rentals.json"
    if File.exist?(rentalData) && File.read(rentalData) != ''
      @rentals = JSON.parse(File.read(rentalData))
    end
    
    @rentals.each do |rental|
      rental = JSON.parse(rental, create_additions: true)
      person = JSON.parse(person, create_additions: true)
      # puts "#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
      p person.id
      # p person_id
      binding.pry
      # if person.id.to_i == person_id.to_i
      #   puts "Date: #{rental.date} - Book: #{rental.book.title} - Author: #{rental.book.author}"
      # else puts "No rental is found"
      # end
    end
  end
end
