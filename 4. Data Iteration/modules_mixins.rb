# * Module Basics
=begin
Module = Grouping of related objects under a single name that can be shared across classes
When used as container of objects, is called a namespace (Ex: Math::PI)
Also can be used as "Mixins" when adding behaviour to class with include keyword
Module is the Superclass of Class, all Classes are Modules
=end

# Example Module
module MeterConversion
    VERSION = 1.0 # Constant

    def self.to_inches(meters) # Define methods with self.whatever
        meters * 39.37
    end

    def self.to_feet(meters)
        meters * 3.28
    end

    def self.to_yards(meters)
        meters * 1.09
    end
end
  
  
puts MeterConversion::VERSION # Access Constant Provided By Module with ::
puts MeterConversion.to_inches(5) # Methods Provided Under Module/Namespace
puts MeterConversion.to_feet(5)
puts MeterConversion.to_yards(5)

# * Using Include
=begin
Mixin behaviour into class from module
Gives access to all methods + constants from module, in a way acts as a superclass
Can override module behaviour if desired
=end

# Example of using include
module Printable
    def print(item)
        "#{item} has been successfully printed."
    end
end
  
class Terminal
    include Printable
    attr_reader :name

    def initialize(name)
        @name = name
    end
end
  
terminal  = Terminal.new("Term")
p terminal.print("Page")

# * Enumerable Mixin
=begin
Already included in collection classes (Array, Hash, Set, etc.)
Adds behaviour such as traversing, searching, sorting, to those classes

MUST define each method for Enumerable mixin to work, just doing an each operation on the collection, taking in a block (see example)
=end

# Item To Be Iterated Over
class Person
    include Comparable # Allows us to implement spaceship (<=>) operator as seen below. Tells Enumerable how two objects should be compared.
    attr_accessor :name, :age

    def initialize(name, age)
        @name, @age = name, age
    end

    def <=>(other_person) # Returns -1 if a < b, 0 if a = b, and 1 if a > b. The result of this function is how Enumerable compares two objects (For sorting and such).
        age <=> other_person.age
    end

    def to_s # Default ran when printing object, so overriding the default behaviour
        "Name: #{name}, Age: #{age}"
    end
end

# Enumerable Object
class Household
    include Enumerable # The one and only Enumerable mixin
    attr_accessor :people

    def initialize
        @people = []
    end

    def add(person) # To add a person to the people array
        people.push(person)
    end

    def each(&block) # Required to be assigned for Enumerable to work
        people.each(&block)
    end
end

# Instantiate people & households + display them
john = Person.new("John", 14)
mark = Person.new("Mark", 35)
tim = Person.new("Tim", 10)
jimmy = Person.new("Jimmy", 45)

household1 = Household.new
household1.add(john)
household1.add(mark)

household2 = Household.new
household2.add(tim)
household2.add(jimmy)

puts "Household 1 Members:\n"
puts household1.people
puts "\n"

puts "Household 2 Members:\n"
puts household2.people
puts "\n"

# Examples using methods given by Enumerable mixin
puts "Are there any Household 2 members with age > 40?\n"
puts household2.any?{|person| person.age > 40}
puts "\n"

puts "Are there any Household 1 members with age > 50?\n"
puts household1.any?{|person| person.age > 50}
puts "\n"

age_below_20 = household2.find_all{|person| person.age < 20}
puts "Household 2 members with age below 20: ", age_below_20
puts "\n"

puts "Sorting default behaviour of Househoud 1 (By Age):"
household1_sorted = household1.sort
puts household1_sorted

# Note: Methods are defined/overwritten by the last or most recent defintion of that method. So, include mixins/define overwrites accordingly.