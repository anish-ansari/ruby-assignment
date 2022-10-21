# a simple class with 3 attributes
class Student
  attr_accessor :name, :grade, :roll_no
end

student1 = Student.new
student1.name = "Anish"
student1.grade = 12
student1.roll_no = 303

puts student1.name, student1.grade, student1.roll_no

# a class with constructor
class Student
  attr_accessor :name, :grade, :roll_no

  def initialize(name, grade, roll_no)
    @name = name
    @grade = grade
    @roll_no = roll_no
  end
end

student1 = Student.new("Anish", 12, 303)

puts student1.name, student1.grade, student1.roll_no

# class with instance/object/class methods
class Student
  attr_accessor :name, :age, :roll_no

  def initialize(name, age, roll_no)
    @name = name
    @age = age
    @roll_no = roll_no
  end

  def adult?
    @age > 18 ? true : false
  end
end

student1 = Student.new("Anish", 22, 303)
student2 = Student.new("Alex", 12, 304)

# puts student1.name, student1.grade, student1.roll_no
puts student1.adult?
puts student2.adult?

# inheritance
class University
  def name
    puts "Pokhara University"
  end
end

uni = University.new
uni.name

class College < University
  def name
    super # looks for name method in University class
    puts "Nepal Engineering College"
  end
end

building = College.new
building.name
building.age

class Person
  def hello
    @name = "Anish Ansari"
    puts @name
  end
end

x = Person.new
x.hello

class Food
  def nutrition(vitamins, minerals)
    puts vitamins
    puts minerals
  end
end

class Bacon < Food
  def nutrition(*) # catch all arguments
    super
  end
end

bacon = Bacon.new
bacon.nutrition("B6", "Iron")

# multilevel inheritance
class GrandFather
  attr_reader :name

  def initialize(name = "I'm a human")
    @name = name
  end

  def display
    puts @name
  end
end

class Father < GrandFather
  attr_reader :name

  def initialize
    @name = super("I'm a father")
  end
end

class Child < Father
  attr_accessor :name

  def initialize
    @name = "I'm a child"
  end
end

grandad = GrandFather.new("I'm a grandad")
grandad.display
father = Father.new
father.display
child = Child.new
child.display

# hierarchical inheritance
class Father
  attr_reader :name

  def initialize(name = "I'm a human")
    @name = name
  end

  def display
    puts @name
  end
end

class Child1 < Father
  attr_reader :name

  def initialize
    @name = super("I'm a child1")
  end
end

class Child2 < Father
  attr_accessor :name

  def initialize
    @name = "I'm a child2"
  end
end

father = Father.new("I'm a father")
father.display

child1 = Child1.new
child1.display

child2 = Child2.new
child2.display

# multiple inheritance not possible without modules
class Manager
  attr_accessor :salary

  def initialize
    @salary = 50000
  end

  def display
    puts @salary
  end
end

class TeamLeader
  attr_accessor :salary

  def initialize
    @salary = 30000
  end

  def add_salary
    @salary += 70000
  end
end

class Worker < Manager
  puts "Hello worker"
end

class Worker < TeamLeader
  puts "hello team leader"
end

worker = Worker.new
