FILE_NAME = "romeo-juliet.txt" # First letter capitalized = Ruby constant, All letters capitalized = convention for constants

# Rescue is exception management for whole function. Begin, rescue, end syntax can be used on its own to catch just specific code
def words_from_file(text_file)
    play_text = File.read(text_file) # Read file data, nothing fancy

    play_text.downcase! # Different than just "downcase" method, this "bang method" (!) modifies the original object instead of returning a new one
    play_text.gsub!(/[^a-z]/, " ") # Replace all things not matching RegExp (not alphabetical) to a space

    split_text = play_text.split # Split string into array of words
    return split_text
rescue => exception
    puts "Error! Make sure #{FILE_NAME} is available and let's do this!"
    exit
end


words = words_from_file(FILE_NAME)

word_count = {}

# The following uses an each loop method which takes in a "block" to perform on each item in the array
# This also uses the optional () feature and the fact that any method can accept a block as an argument just outside it's () or after other args
# Blocks can also be denotd by the do / end keywords, or {} in their places directly. Convention = do/end for multi-line.
words.each do |word| 
    word_count[word] = 0 unless word_count[word] # EXTREMELY wacky conditional syntax, could have just made an if/else
    word_count[word] += 1
end

# Sort by count (creates array of arrays from hash), reverse it so the highest is first and take the top 40 from that, loop to print
word_count.sort_by {|word, count| count }
    .reverse[0...40]
    .each {|word, count| puts "#{word}: #{count}"}