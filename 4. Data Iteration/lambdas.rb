# * Lambda Basics
=begin
Similar to Proc but a few notable differences:
    -> Lambda validates number of args passed to it, Proc does not
    -> Return keyword returns back to the method, Proc returns outside the method if called

(Essentially stricter Lambdas)
=end

# Demonstrating how they are members of the same class
example_proc = Proc.new { |name| puts "Name is: #{name}!" }
example_lambda = lambda { |name| puts "Name is: #{name}!" }

p example_proc.class
p example_lambda.class
# Ouput is Proc for both, they are both Procs technically

# * Lambda vs Proc Arg Validation

# Proc: All 3 Execute
example_proc.call("John", "Invalid Arg")
example_proc.call
example_proc.call("John")

# Lambda: Only Last (1 Arg) Executes
# example_lambda.call("John", "Invalid Arg") ArgumentError: "wrong number of arguments"
# example_lambda.call ArgumentError: "wrong number of arguments"
example_lambda.call("John")

# * Lambda vs Proc Returning
def lambda_inside
    return_lambda = lambda { return }
    return_lambda.call
    puts "In Method! (Lambda)"
end

def proc_inside
    return_proc = Proc.new { return }
    return_proc.call
    puts "In Method! (Proc)"
end

lambda_inside # Returns to execution inside parent method, can see output
proc_inside # Returns completely outside of parent method, no output