class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update]
    
    def index
        @users = User.all
    end
    
    def show    
    end
    
    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params(:first_name, :last_name, :username, :password, :age, :email, :address, :phone_number))

        if @user.save
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
    end

    def update
        if @user.update(user_params(:first_name, :last_name, :username, :age, :email, :address, :phone_number))
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params(*args)
        params.require(:user).permit(*args)
    end

end
