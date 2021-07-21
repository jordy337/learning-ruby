# * Read from file

file_location = "./demo_files/sample.txt"
new_content = "I'm new content!"

# Method 1
file = File.open(file_location)
content = file.read

# Method 2
file_content = File.read(file_location)

# * Writing to file

# Method 1
File.write(file_location, new_content, mode: "a") # Symbol argument mode: "a" tells method to append instead of overwrite (default)

# Method 2
File.open(file_location, "a") do |file|
    file.write(new_content)
end

# * Reading CSV

require "csv"
csv_location = "./demo_files/sample.csv"

# Method 1 - Treat as string
csv_string = File.read(csv_location) # This isn't very useful, can't access data easily.

# Method 2 - CSV library
csv_file = File.read(csv_location)
csv_data = CSV.parse(csv_file, headers: true)
# headers: true arg allows us to access each attr as apart of a hash, referencing the header as the key
# Without it, we get array of arrays for lines. As stated, this returns an array of hases.

csv_data.each do |d|
    puts "Date: #{d["date"]} Price: #{d["price"]}"
end

# Method 3 - Clean it up
csv_parsed = CSV.read(csv_location, headers: true, col_sep: ",") # col_sep specifies CSV delimiter/seperator

# * Writing CSV

data = [
    ["id", "first_name", "last_name"],
    [1, "Johh", "Doe"],
    [2, "Michael", "Smith"],
    [3, "Sally", "Dean"],
    [4, "Peter", "Rabbit"],
    [5, "Jessie", "Fanning"]
] # CSV formatted array of arrays, what simple CSV.parse returns

# Method 1 - Write as string
csv_string = data.map{ |d| d.join(",") }.join("\n")
File.write("./demo_files/demo_generated.csv", csv_string)

# Method 2 - CSV library
CSV.open("./demo_files/demo_generated.csv", "w") do |c| # You guessed it! "w" means write, use "a" to append
    # c is CSV array of arrays, << operator is to append
    c << ["id", "first_name", "last_name"]
    c << [1, "Johh", "Doe"]
    c << [2, "Michael", "Smith"]
    c << [3, "Sally", "Dean"]
    c << [4, "Peter", "Rabbit"]
    c <<  [5, "Jordyn", "Mindorff"]
end

# Method 3 - Slightly different, use CSV library to generate CSV string and then write to file
generated_csv = CSV.generate do |c|
    c << ["id", "first_name", "last_name"]
    c << [1, "Johh", "Doe"]
    c << [2, "Michael", "Smith"]
    c << [3, "Sally", "Dean"]
    c << [4, "Peter", "Rabbit"]
    c <<  [5, "Jordyn", "Murphy Mindorff"]
end

File.write("./demo_files/demo_generated.csv", generated_csv)