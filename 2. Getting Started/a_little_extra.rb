# * Reading Data:

user_input = gets # Counterpart to puts, get terminal input
puts "You said: #{user_input}"

puts ENV["USERDOMAIN"] # ENV holds system environment variables. Set with 'setx NAME "VALUE"' on windows or 'export NAME=VALUE' on Unix
# It's a hash (key-value store, as earlier explored)

# STDIN.read is used to read standard input data

puts ARGV # Prints command line arguments, held in array
# ^ Passing arguments changes the behaviour of "gets," beware

# * Single vs Double Quote

# Essentially, Single Quote = literal, Double quote = processed
print "Test\n" # Side note: Prints is like puts but doesn't do auto new line
print 'Test\n' # Literally puts the \n character as written

# String interpolation only works with double quotes
puts "The answer is #{2 / 2}"
puts 'The answer is #{2 / 2}'

# * Global Variables

=begin
Variables in Ruby are somewhat tightly scoped to where they were created
For instance, you CANNOT access a local variable from outside a function from within that function.
So, global variables can be useful.
=end

$test_variable = 123 # Syntax for global
test_variable = 321 # If no $ but same name, entirely different variable

def test_function()
    puts $test_variable
    # ! puts test_variable (Throws error, not in scope, must be passed as argument to access it)
end

test_function()

# * Arrays And Array Indexing (Not technically a little extra)

test_array = [1, "one", 1.0] # Dyanmically typed, not restricted to one type, basic Array notation
puts test_array[0] # Zero-indexed
puts test_array[-1] # Can also negatively index to go backwards, so this is the last element
puts test_array[1..2] # Array "range," takes subset of array based on an array of indexes
puts test_array[0..] # Open-ended range, 2 onward

puts test_array.length # Length, Size, and Count all work in Ruby as methods to get the number of elements of the array

# * Hashes (Not technically a little extra)
# Hashes are like JS Objects, key-value store
test_hash = {
    "key1" => "value1",
    "key2" => "value2",
    "key3" => "value3",
}
test_hash["key4"] = "value4"

puts test_hash["key4"]

# * Symbols
hello_symbol = :hello # This is the symbol notation, they are like strings but IMMUTABLE and often used for the names of things, like methods
hello_variable = "hello"

puts hello_symbol, hello_variable # As you can see, they are pretty similar in behaviour, except that you cannot do anything to a symbol after init

# You can also notate hashes differently with symbols
symb_hash = { :test1 => 1, :test2 => 2 }
symb_hash_special = { test1: 1, test2: 2 } # Syntatic sugar for symbol-keyed hashes, elimiantying the "hash-rocket" (=>) and moving the :

# * Iteration/Loops

# Classic for loop
for i in 0...test_array.length do # Three dots = range but ignore last, so like test_array.length -1
    # Do Something
end

# Even more clasic while loop
i = 0
while i <= 5
    # Do something
    i += 1
end

# Like while, but opposite condition. Loop until ...
until i > 5
    # Do something
    i += 1
end

# Call upto method on integer, loop based on passed Block
0.upto(5) do |i|
    # Do something
end

# Literally do something a number of times as a method of an int, no provided index, although you could create one and increment it
5.times do
    # Do something five times I guess
end

# * Conditionals
# Note: nil and false are really the only values that auto evaluate to false in Ruby. Strings, 0, empty strings "" all are true


# Regular Conditonal 
if test_variable == 1
    # Do something
elsif test_variable == 2
    # Do something else
else
    # Do something else else
end 

# Weirder
puts test_variable if test_variable != 2

# WAY WEIRDER
puts test_variable unless test_variable == 2

# "Case," like a switch
case test_variable
when 1
    puts "Is 1"
when 2
    puts "Is 2"
when 321
    puts "YAY, IT'S 321"
else
    puts "It's something entirely different, that's crazy"
end

# Works on the "case equal operator" (===)
puts test_variable === 1 # False
puts (1..10) === 5 # True, case equal evaluates if something is in a range in this case
# RegExp is === w/ a string if it matches

# * Exception Management

begin
    # Do code that can throw an exception
rescue => exception
    # Rescue it, referencing the exception
end

# Example of only catching one type of exception, just reference the class name
begin
    # Do code that can throw an exception
rescue UnknownUsernameError => exception
    # Rescue it, referencing the exception
    raise exception # Re-raise the exception for whatever reason
end

# Extra blocks
begin
    # Do code that can throw an exception
rescue => exception
    # Rescue it, referencing the exception
else
    # Optional extra block for no exception
ensure
    # Gets executed at the end no matter what
    # Usually used for cleanup, like closing a connection before crashing or continuing onward
end