require_relative './spec_helper'

describe Classroom do
  it 'creates a new instance of the BaseDecorator class' do
    classroom = Classroom.new('CS50')
    expect(classroom).to be_an_instance_of Classroom
  end

  it 'adds a student object to the array' do
    student = {name: 'Hans', age: 12, parent_permission: true}
    name = Classroom.new('cephalothorax')
    name.add_student(student)
    expect(name.students.length).to eq(1)
  end
end