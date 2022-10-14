require_relative './spec_helper'

describe Student do
  it 'creates a new instance of the Person class' do
    student = Student.new(23, 'John', true)
    expect(student).to be_an_instance_of Student
  end

  it 'correct_name returns the name of the person object' do
    name = Student.new(23, 'John', false)
    expect(name.can_use_services?).to eq(true)
  end
end
