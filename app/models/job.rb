require 'net/http'
# require 'json'
# require 'dotenv'
Dotenv.load('./.env')

class Job < ApplicationRecord
    has_many :saved_jobs
    has_many :users, through: :saved_jobs

end
