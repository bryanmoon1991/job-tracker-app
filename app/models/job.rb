require 'net/http'
# require 'json'
# require 'dotenv'
Dotenv.load('./.env')

class Job < ApplicationRecord
    has_many :saved_jobs
    has_many :users, through: :saved_jobs
    
    def total_savers
        SavedJob.all.find_all{|sj| sj.job_id == self.id }.count
    end

end
