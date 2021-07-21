require 'csv'
require 'json'
require 'net/http'
require 'date'

# Extract JSON Data
def extract_data(content)
    data = JSON.parse(content)
    
    current_date = Date.parse(data["time"]["updated"]).strftime("%Y-%m-%d")
    current_price = data["bpi"]["USD"]["rate_float"]

    return { "current_date" => current_date, "current_price" => current_price }
end

extracted_data = extract_data(File.read('./demo_files/sample.json'))
puts extracted_data['current_date']
puts extracted_data['current_price']