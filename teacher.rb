require_relative 'person'

class Teacher < Person
  attr_accessor :id, :specialization

  def initialize(age, specialization, name = 'unknown', parent_permission: true)
    super(name, age, parent_permission)
    @id = Random.rand(1..1000)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
