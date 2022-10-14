require_relative './spec_helper'

describe CapitalizeDecorator do
  it 'creates a new instance of the BaseDecorator class' do
    name = CapitalizeDecorator.new('leeroy')
    expect(name).to be_an_instance_of CapitalizeDecorator
  end

  it 'capitalizes a given name string' do
    name = CapitalizeDecorator.new('leeroy')
    expect(name.correct_name).to eq 'LEEROY'
  end
end
