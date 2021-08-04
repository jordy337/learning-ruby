# * Block Basics
=begin
Block = a group of code connected to a method call (can't have a block without a method), to be executed at some time
Block != an object of any kind
Block can be defined with {} or do & end keywords (do end is convention for multi-line)
Blocks are only invoked one, do not persist, have seperate actions from their associated method
=end

# Example
2.times { puts "Testing with {}" }
2.times do
    puts "Inside a block yo"
    puts "We multi-line in here"
end 

# Example 2
testing_array = [1, 2, 3]
testing_array.each { |num| puts "We on #{num}" } # Pipe characters define block params/args

# * Creating a Method that Employs Blocks
=begin
Clarification: Paramater = Variable used within method definition, Argument = Value corresponding to said parameter, as defined when called
Blocks are often passed as arguments to methods
=end

# Simple Method-Attached Example
def my_method
    puts "Inside my method"
    yield "Argument Passed" # Yields to/runs attached block if applicable, can be caled multiple times
    # Sidenote because this is still confusing, yield is just a function and I could chose to run it as yield(arguments) if I wanted
end

my_method do |arg|
    puts "Hi from block as argument! Method says: #{arg}"
end

# Example Explicitly Defining Paramater
def greet(question, &my_block)
    puts question
    name = gets.chomp
    my_block.call(name) # Alternative to yield, if specified as parameter
end 

greet("What's your name?") do |name|
    puts "Hello #{name}"
end

# * Blocks w/ Built-in Types
# (A few examples of fefault utility class methods that take blocks)

# Arrays
testing_array.each{ |item| "Do something with each item..." }
testing_array.delete_if { |item| "Delete array item if block evalauates to/returns true" }

# Hashes
testing_hash = { "name" => "John", "age" => 18 }
testing_hash.each do |key, value|
    "Do something with hash key + value pair for each pair"
end
# each_key & each_value also exist to only iterate over those values of the hash

# Strings
testing_string = "Ruby"
string.each_char{ |letter| "Do something with each letter/char..." }
string.each_line{ |line| "Do something with each line if its multi-line..." }

# Integers
2.upto(6) { |num| "Do something with each number from 2-6" }
2.times { "Do something x times" }