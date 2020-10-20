class SavedJobsController < ApplicationController
    
    def create
    end
    
    def destroy
        @saved_job = SavedJob.find(params[:id])
        @saved_job.destroy
        redirect_to jobs_path
    end
    
    def show
        @saved_job = SavedJob.find(params[:id])
    end
    
end
