require 'net/http'
Dotenv.load('./.env')

class JobsController < ApplicationController
    # skip_before_action :authorized?, only: [:new, :index, :search]


    def index
        # @user = User.find(session[:user_id])
        # @jobs = 
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
        params.permit(:title, :location, :snippet, :salary, :source, :type, :link, :updated, :jooble_id)
    end

end