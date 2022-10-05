require_relative 'person'

class Student < Person
  attr_accessor :id, :classroom

  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(name, age, parent_permission)
    @id = Random.rand(1..1000)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
