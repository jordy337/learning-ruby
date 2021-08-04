# * Proc Bsics
=begin
Proc = "Procedure," object that is essentially a saved block
Block != Strictly apart of a method call, non-object
Can only pass one Block to method, can pass multiple Procs
Can "invoke" without method

Basically, small function type objects that behave similar to blocks, but are defined explicitly as objects and can be called seperately to a method
=end

# Example w/ Blocks
evens = [2, 4, 6, 8]
odds = [1, 3, 5, 7]

square_of_evens = evens.map { |num| num ** 2 }
square_of_odds = odds.map { |num| num ** 2 }

p square_of_evens
p square_of_odds

# Example w/ Procs
squares = Proc.new { |x| x ** 2 }
even_squares = evens.map(&squares)
odd_squares = odds.map(&squares)

# Difference = Only need to define "squaring action" once, then pass in as an argument to map with & so Ruby knows it is a proc to be ran as a block

p even_squares
p odd_squares

# Example of Calling Alone
greet = Proc.new { puts "Hello there partner!" }
greet.call