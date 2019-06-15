#!/usr/bin/env ruby

require 'webrick'
require 'faker'
require 'json'

class FrenoMockServer < WEBrick::HTTPServlet::AbstractServlet
    def do_GET (request, response)
      response.status = [200, 417, 429, 500].sample
      response.content_type = "application/json"
      response.body = {'Value' => 23}.to_json
    end
end

server = WEBrick::HTTPServer.new(:Port => 1234)

server.mount "/", FrenoMockServer

trap("INT") {
  server.shutdown
}

server.start
