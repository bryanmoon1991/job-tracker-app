class SessionsController < ApplicationController
    skip_before_action :authorized?, only: [:new_login, :login, :home, :logout]

    def home
        render :home
    end

    def new_login
    end 
    
    def login 
        @user = User.find_by(username: params[:session][:username])
        
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id 
            # @current_user = @user
            
            redirect_to jobs_path
        else 
            
            flash[:error] = "Password or Username did not match"
            redirect_to new_login_path
        end 
    end 
    
    def logout 
      session.delete(:user_id)
      redirect_back fallback_location: root_path 
    end 

end