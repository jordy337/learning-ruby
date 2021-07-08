# Built in libraries like csv, json, debug, readline, OpenURI etc.
require 'open-uri' # Example

# External libraries are called "Gems," and they come from RubyGems (like Packages & NPM)
# rubygems.org / gem command (gem install...) / Bundler for project-specific gem management

# Boiler plate
require 'rubygems'
require 'bundler/setup'

# Require specific Gems
require 'multi_json'

URI.open("https://jsonplaceholder.typicode.com/users/1") {|result|
    parsed = MultiJson.load(result.string)
    puts parsed
}

=begin
Above example is just random messing around. It uses a default library (open-uri) to make a get request, and then multi_json, loaded
with bundler/RubyGems to parse it into a Ruby "Hash," which is a way of storing key-value data, like a JSON/JS Object. 
=end