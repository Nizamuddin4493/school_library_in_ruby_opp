require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name)
    super(age, name)
    # @id = Random.rand(1..1000)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [self.id, age, specialization, name ]
    }.to_json(*args)
  end
  def self.json_create(object)
    new(*object['a'])
  end
end
