require './nameable'
require './decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    value = false
    value = true if of_age? || @parent_permission
    value
  end

  def correct_name
    @name
  end

  private

  def of_age?
    value = false
    value = true if @age >= 18
    value
  end
end
