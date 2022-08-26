require './person'
class Student < Person
  def initialize(classroom)
    super
    @classroom = classroom
  end

  def play_hooky
    puts "¯\(ツ)/¯"
  end
end

std = Student.new('6th')

puts std.play_hooky
