require 'sinatra'
require 'json'
require 'faker'

get '/' do
  status_code = [200, 400,  404, 417, 429, 500, 503].sample

  body = {
    'Status' => status_code
  }
  body['Message'] = case status_code
                    when 200 then 'No Replication Lag'
                    when 400 then 'Bad Request'
                    when 404 then 'Route Not Found'
                    when 417 then 'Application Throttled'
                    when 429 then 'Replication Lag'
                    when 500 then 'Internal Server Error'
                    when 503 then 'Service Unavailable'
                    end
  body['Value'] = Faker::Number.within(0..100000).to_i/1000.0 if status_code.eql?(429)

  puts body
  status status_code
  content_type :json
  body.to_json
end
