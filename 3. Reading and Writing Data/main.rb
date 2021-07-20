require 'csv'
require 'json'
require 'net/http'

file_location = 'sample.txt'
content = File.read(file_location)

puts content