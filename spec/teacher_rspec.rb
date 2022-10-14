require_relative './spec_helper'

describe Teacher do
  it 'creates a new instance of the Person class' do
    teacher = Teacher.new(23, 'coder', 'Ibrahim')
    expect(teacher).to be_an_instance_of Teacher
  end

  it 'returns true for Teacher class when invoked' do
    name = Teacher.new(23, 'coder', "Ibrahim")
    expect(name.can_use_services?).to eq(true)
  end
end
