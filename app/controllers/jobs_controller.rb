require 'net/http'
Dotenv.load('./.env')

class JobsController < ApplicationController
    # skip_before_action :authorized?, only: [:new, :index, :search]

    def index
        # byebug
        if params[:keywords]
            @search_term = params[:keywords]
            post_args = Hash.new
            post_args[:keywords] = params[:keywords]
            post_args[:location] = params[:location] 
            post_args[:radius] = params[:radius]
            post_args[:salary] = params[:salary]
            post_args[:page] = 1
            @results = search(post_args)

        end
    end

 
    def new
        @job_search
    end

    def show
        @job = Job.find(params[:id])
    end
    
    def create
        if new_job = Job.find_by(jooble_id: params[:jooble_id])
            SavedJob.create(user:@current_user, job: new_job)
            redirect_to job_path(new_job)
        else

            new_job = Job.create(job_params)
            SavedJob.create(user:@current_user, job: new_job)
            redirect_to job_path(new_job)
        end
    end
    

    def search(query)        
        url = "https://jooble.org/api/#{ENV['JOOBLE_KEY']}"
        #create uri for request
        uri = URI.parse(url)
        #prepare post data
        post_args = query
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
        params.permit(:title, :location, :snippet, :salary, :source, :job_type, :link, :updated, :jooble_id)
    end

end