class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
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

  private

  def of_age?
    value = false
    value = true if @age >= 18
    value
  end
end
