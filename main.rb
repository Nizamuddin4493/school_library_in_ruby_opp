require_relative 'app'

class Main
  attr_accessor :app

  def initialize
    @app = App.new
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

      @app.options(input)
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
end

run_prog = Main.new
run_prog.run
