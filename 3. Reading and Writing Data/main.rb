require 'csv'
require 'json'
require 'net/http'
require 'date'

archive_file = "btc_archive.csv"
endpoint = "https://api.coindesk.com/v1/bpi/currentprice.json"

# Make Get Request
def get_request(endpoint)
    uri = URI(endpoint)
    response = Net::HTTP.get_response(uri)

    if response.code.to_s != "200"
        raise StandardError.new "HTTP Request Failure"      
    else
        return response.body
    end
rescue => exception
    puts "Something went wrong...", exception
    exit
end

# Extract JSON Data
def extract_data(content)
    data = JSON.parse(content)
    
    current_date = Date.parse(data["time"]["updated"]).strftime("%Y-%m-%d")
    current_price = data["bpi"]["USD"]["rate_float"]

    return { "current_date" => current_date, "current_price" => current_price }
end

# Archive Data to CSV
def add_price(file_location, current_date, current_price)
    CSV.open(file_location, "a") do |f|
        f << [current_date, current_price]
    end
end

# Do The Thing
btc_data = extract_data(get_request(endpoint))
add_price(archive_file, btc_data["current_date"], btc_data["current_price"])