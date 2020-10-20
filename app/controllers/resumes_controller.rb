class ResumesController < ApplicationController
    
    def new
        @resume = Resume.new
    end
    
    def create
        @resume = Resume.new(resume_params)
        @resume.user_id = session[:user_id]
        @resume.save
        redirect_to user_path(@resume.user)
    end
    
    def show
        @resume = Resume.find(params[:id])
        @user = User.find(session[:user_id])
    end
    
    def destroy
        @user = User.find(session[:user_id])
        @resume = Resume.find(params[:id])
        @resume.destroy
        redirect_to user_path(@user)
    end
    
    private
    
    def resume_params
        params.require(:resume).permit(:job_title, :description, :reference)
    end
    
end
