require 'net/http'
Dotenv.load('./.env')

class SearchController < ApplicationController

    

    def create
        url = "https://jooble.org/api/#{ENV['JOOBLE_KEY']}"
        uri = URI.parse(url)
        #replace values with instance variables?
        # post_args = { 'keywords': params[:session][:keywords], 'page':"1" }
        post_args = params[:session]
        #send request to the server
        http = Net::HTTP.new(uri.host, uri.port)
        #for https
        http.use_ssl = true
        request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
        request.body = post_args.to_json
        #send request to the server
        @response = http.request(request)
      
        # byebug
        render :result
    end
end
