require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    if @nameable.length > 10
      @nameable[0, 10]
    else
      @nameable
    end
  end
end
