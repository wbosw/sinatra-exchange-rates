
require "http"
require "json"

api_url = "https://api.exchangerate.host/convert?access_key=#{ENV["EXCHANGE_RATE_API_KEY"]}&from=USD&to=INR&amount=1"

    raw_data = HTTP.get(api_url)
  
    raw_data_string = raw_data.to_s
  
    parsed_data = JSON.parse(raw_data_string)
  
    @info = parsed_data.fetch("info")
  
    pp @rate = @info.fetch("quote")

  # @symbol_array = @symbols.keys
