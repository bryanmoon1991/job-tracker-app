class SessionsController < ApplicationController


    def new_login
    end 
    
    def login 
        @user = User.find_by(username: params[:session][:username])
        
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id 
            redirect_to jobs_path
        else 
            
            flash[:error] = "Password or Username did not match"
            redirect_to new_login_path
        end 
    end 
    
    def logout 
      session.delete(:user_id)
      redirect_back fallback_location: jobs_path
    end 

end