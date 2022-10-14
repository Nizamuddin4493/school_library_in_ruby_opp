require_relative './spec_helper'

describe Rental do
  it 'creates a new instance of the Rental class' do
    nameable = Rental.new('2023-12-12', {}, {})
    expect(nameable).to be_an_instance_of Rental
  end
end