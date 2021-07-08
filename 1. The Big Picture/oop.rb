# Class example
class Dispenser
    # Initializiation function, like a constuctor, auto-ran
    def initialize()
        refill(5)
    end

    # Methods
    def refill(liters)
        @liters = liters # The @ indicates a field on the object, think this.liters is the same as @liters
    end

    def dispense(liters)
        if @liters >= liters
            @liters -= liters
            return "#{@liters} liters of water remaining." # String Interpolation
        else
            return "Not enough. Please refill."
        end
    end
end

# Create instance object, use a method
office_dispenser = Dispenser.new
puts office_dispenser.dispense(5)

# ? How far do objects go in Ruby?

test_array = [1, 2, 3]
puts test_array.class
puts test_array.size
# Arrays are instances of the Array class. Interesting to note that these are not fields we are acccessing, they are methods returning these values.
# The () are optional to call object methods. 

# Also an object, instance of float
test_number = 2.3
puts test_number.class

# Puts itself is a method! Of the invisible "main" object. It utilizes the optional () in most examples.
# Point is, OOP goes really deep to the core in Ruby, it's all over.