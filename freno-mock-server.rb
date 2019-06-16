require 'sinatra'
require 'json'
require 'faker'

get '/' do
  status_code = [200, 417, 429, 500].sample
  response_value = Faker::Number.within(0..20000).to_i/1000.0
  puts "Status Code: #{status_code} | Response Value: #{response_value}"

  status status_code
  content_type :json
  {'Status' => status_code, 'Value' => response_value}.to_json
end
