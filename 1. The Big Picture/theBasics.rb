require "csv" # Require a default library

albums = CSV.read("albums.csv") # Array of arrays for rows of data - "collection"
albums = albums[1..] # Use range to reassign value to all values after index 0

# Constants, at least first letter must be upper case
GENRE = 2
YEAR = 3

# * Method 1
def classic_jazz?(album) # The ? is a legal Ruby character for naming, often used to signify T/F return
    album[GENRE] == "Jazz" and album[YEAR].to_i.between?(1950, 1959) # String.to_i = make it an integer
end

#  This is a traditional loop, but a little complex and annoying
selected_albums = []

for i in 0...albums.length do # Three dots is a range but remove last, so like albums.length - 1
    if classic_jazz?(albums[i]) # Conditional
        selected_albums << albums[i] # Push to array
    end
end

puts selected_albums # Ouput result

# * Method 2
# Lets turn that classic_jazz? function into a "block" (anonymous function of sorts) and apply the "array.select" method to get the values we want
selected_albums = albums.select{|album|
    album[GENRE] == "Jazz" and album[YEAR].to_i.between?(1950, 1959)
}.sort_by {|album|
    album[YEAR].to_i
}.each {|album|
    puts album.join(', ')
}