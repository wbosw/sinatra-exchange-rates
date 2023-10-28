require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

api_url = "https://api.exchangerate.host/list?access_key=#{ENV["EXCHANGE_RATE_API_KEY"]}"

raw_data = HTTP.get(api_url)

raw_data_string = raw_data.to_s

parsed_data = JSON.parse(raw_data_string)

@symbols = parsed_data.fetch("currencies")

pp @symbol_array = @symbols.keys

 get("/") do
   api_url = "https://api.exchangerate.host/list?access_key=#{ENV["EXCHANGE_RATE_API_KEY"]}"

   raw_data = HTTP.get(api_url)
  
   raw_data_string = raw_data.to_s
  
   parsed_data = JSON.parse(raw_data_string)
  
   @symbols = parsed_data.fetch("currencies")
  
   @symbol_array = @symbols.keys
   
   erb(:homepage)
  
 end


 get("/:from_currency") do
  @original_currency = params.fetch("from_currency")

  api_url = "https://api.exchangerate.host/list?access_key=#{ENV["EXCHANGE_RATE_API_KEY"]}"

  raw_data = HTTP.get(api_url)
 
  raw_data_string = raw_data.to_s
 
  parsed_data = JSON.parse(raw_data_string)
 
  @symbols = parsed_data.fetch("currencies")
 
  @symbol_array = @symbols.keys
  erb(:second_page)
  # some more code to parse the URL and render a view template
end


get("/:from_currency/:to_currency") do
  @original_currency = params.fetch("from_currency")
  @to_currency = params.fetch("to_currency")

  api_url = "https://api.exchangerate.host/convert?access_key=#{ENV["EXCHANGE_RATE_API_KEY"]}&from=#{@original_currency}&to=#{@to_currency}&amount=1"

    raw_data = HTTP.get(api_url)
  
    raw_data_string = raw_data.to_s
  
    parsed_data = JSON.parse(raw_data_string)
  
    @info = parsed_data.fetch("info")
  
    pp @rate = @info.fetch("quote")

  erb(:thirdpage)
  # some more code to parse the URL and render a view template
end
