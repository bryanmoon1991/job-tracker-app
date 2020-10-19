# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(first_name: , last_name: , username: , password_digest: , age: , address: , email: , phone_number: )
# Resume.create(job_title: , description: , reference: , user_id: )
# Job.create(title: , location: , snippet: , salary: )
# SavedJob.create(user_id: , job_id:, status: )


10.times do 
    User.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, username: Faker::Internet.username, password_digest: Faker::Internet.password, age: rand(18..40), address: Faker::Address.full_address, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.cell_phone.to_s)
end

User.all.each do |user|
    Resume.create(job_title: Faker::Job.title, description: Faker::Company.bs, reference: Faker::Name.name, user_id: user.id)
end

10.times do
    Job.create(title: Faker::Job.title, location: Faker::Address.city, snippet: 
    Faker::Quote.most_interesting_man_in_the_world, salary: rand(40000..200000))
end

20.times do
    SavedJob.create(user_id: User.all.sample.id, job_id: Job.all.sample.id, status: rand(1..2))
end