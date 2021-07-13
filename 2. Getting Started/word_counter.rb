FILE_NAME = "romeo-juliet.txt" # First letter capitalized = Ruby constant, All letters capitalized = convention for constants

def words_from_file(text_file)
    play_text = File.read(text_file) # Read file data, nothing fancy

    play_text.downcase! # Different than just "downcase" method, this "bang method" (!) modifies the original object instead of returning a new one
    play_text.gsub!(/[^a-z]/, " ") # Replace all things not matching RegExp (not alphabetical) to a space

    split_text = play_text.split # Split string into array of words
    return split_text
end

words = words_from_file(FILE_NAME)

word_count = {}

# The following uses an each loop method which takes in a "block" to perform on each item in the array
# This also uses the optional () feature and the fact that any method can accept a block as an argument just outside it's () or after other args
# Blocks can also be denotd by the do / end keywords, or {} in their places directly. Convention = do/end for multi-line.
words.each do |word| 

end