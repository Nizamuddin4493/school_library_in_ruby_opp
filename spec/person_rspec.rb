require_relative './spec_helper'

describe Person do
  it 'creates a new instance of the Person class' do
    person = Person.new('age', 'name')
    expect(person).to be_an_instance_of Person
  end

  it '#correct_name returns the name of the person object' do
    person = Person.new(23, 'John')
    expect(person.can_use_services?).to eq(false)
  end

  it '#correct_name returns the name of the person object' do
    person = Person.new(23, 'John')
    expect(person.correct_name).to eq('John')
  end

  it 'adds a rentals object to the array' do
    rental = {}
    person = Person.new(23, 'John')
    person.add_rental(rental)
    expect(person.rentals.length).to eq(1)
  end
end
