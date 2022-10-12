require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :id

  def initialize(age, specialization, name)
    super(age, name)
    @specialization = specialization
    @id = id
  end

  def can_use_services?
    true
  end
end
