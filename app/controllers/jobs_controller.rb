class JobsController < ApplicationController
    require 'net/http'


    def index
        @jobs = Job.all
        if params[:q]
            @search_term = params[:q]
            @results = search(@search_term)
        end
    end

    def new
        @job_search
    end

    def show
        @job = Job.find(params[:id])
    end

    def search(query)        
        url = "https://jooble.org/api/#{ENV['JOOBLE_KEY']}"
        #create uri for request
        uri = URI.parse(url)
        #prepare post data
        post_args = { 'keywords': query }
        #send request to the server
        http = Net::HTTP.new(uri.host, uri.port)
        #for https
        http.use_ssl = true
        request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
        request.body = post_args.to_json
        #send request to the server
        response = http.request(request)
        JSON.parse(response.body)
    end

    private

    def job_params
        params.require(:job).permit(:search)
    end

end
