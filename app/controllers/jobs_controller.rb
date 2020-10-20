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
    
    def create
        # job_title = params[:job_title]
        # location = params[:location]
        # snippet = params[:snippet]
        # salary = params[:salary]
        # source = params[:source]
        # job_type = params[:type]
        # link = params[:link]
        # updated = params[:updated]

        new_job = Job.create(job_params)
        byebug
        redirect_to job_path(new_job)
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
        params.permit(:title, :location, :snippet, :salary, :source, :type, :link, :updated)
    end

end
