class User < ApplicationRecord
    has_many :saved_jobs
    has_many :resumes
    has_many :jobs, through: :saved_jobs
end
