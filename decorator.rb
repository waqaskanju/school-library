require './nameable'

class Decorator < Nameable
  attr_accessor :person

  def initialize(person)
    super()
    @person = person
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @person.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    @person.correct_name[0, 10]
  end
end
