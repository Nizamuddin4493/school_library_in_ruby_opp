require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission)
    super(age, name)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [self.id, age, name, @parent_permission ]
    }.to_json(*args)
  end
  def self.json_create(object)
    new(*object['a'])
  end

  private

  def of_age?
    @age >= 18
  end
end
