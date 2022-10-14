require_relative './spec_helper'

describe Person do
  it 'creates a new instance of the Person class' do
    person = Person.new('age', 'name')
    expect(person).to be_an_instance_of Person
  end

  it 'correct_name returns the name of the person object' do
    name = Person.new(23, 'John')
    expect(name.correct_name).to eq('John')
  end
end
