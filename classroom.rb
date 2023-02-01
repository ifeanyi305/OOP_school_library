class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(students)
    @students << student
    student.classroom = self
  end
end
