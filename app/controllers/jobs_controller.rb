class JobsController < ApplicationController

    def index
    end

    def new
    end

    def show
    end

    def create
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
