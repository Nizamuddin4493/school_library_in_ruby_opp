require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'unknown')
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @rentals = []
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
