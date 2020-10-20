class User < ApplicationRecord
    has_many :saved_jobs
    has_many :resumes
    has_many :jobs, through: :saved_jobs
    has_secure_password
    
    def full_name
        self.first_name + " " + self.last_name
    end
end
