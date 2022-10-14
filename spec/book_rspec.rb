require_relative './spec_helper'

describe Book do
  it 'creates a new instance of the BaseDecorator class' do
    book = Book.new('title', 'auther')
    expect(book).to be_an_instance_of Book
  end

  it 'adds a student object to the array' do
    rental = {}
    name = Book.new('Js Master', 'John')
    name.add_rental(rental)
    expect(name.rentals.length).to eq(1)
  end
end
