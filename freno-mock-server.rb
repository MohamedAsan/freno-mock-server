require 'sinatra'
require 'json'
require 'faker'

get '/' do
  status_code = 429
  response_value = Faker::Number.within(60000..100000).to_i/1000.0
  puts "Status Code: #{status_code} | Response Value: #{response_value}"

  status status_code
  content_type :json
  {'Status' => status_code, 'Value' => response_value}.to_json
end
