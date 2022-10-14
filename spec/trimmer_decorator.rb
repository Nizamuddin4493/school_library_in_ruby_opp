require_relative './spec_helper'

describe TrimmerDecorator do
  it 'creates a new instance of the BaseDecorator class' do
    name = TrimmerDecorator.new('leeroy')
    expect(name).to be_an_instance_of TrimmerDecorator
  end

  it 'capitalizes a given name string' do
    name = TrimmerDecorator.new('cephalothorax')
    expect(name.correct_name).to eq 'cephalotho'
  end
end