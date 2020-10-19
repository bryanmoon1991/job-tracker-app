class JobsController < ApplicationController

    def index
    end

    def new
        @search
    end

    def show
    end

    def create
        url = "https://jooble.org/api/#{ENV['JOOBLE_KEY']}"
        uri = URI.parse(url)
        #replace values with instance variables?
        # post_args = { 'keywords': params[:session][:keywords], 'page':"1" }
        #send request to the server
        http = Net::HTTP.new(uri.host, uri.port)
        #for https
        http.use_ssl = true
        request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
        request.body = params[:job].to_json
        #send request to the server
        @response = http.request(request) 
        byebug
    end

    def new_search
    end

    def search
        
    end

    private

    def job_params
        params.require(:job).permit(:query)
    end

end
