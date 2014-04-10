namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  require 'populator'
  require 'faker'
    99.times do |n|
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(email: email,
                   password: password,
                   password_confirmation: password)
    end   
    500.times do |n|
      first_name = Faker::Name.first_name
      last_name  = Faker::Name.last_name
      age        = Faker::Number.number(2)
      sex        = "male"
      email      = Faker::Internet.email
      phone   = Faker::Number.number(10)
      city       = Faker::Address.city
      state      = Faker::Address.state
      country    = Faker::Address.country
      zipcode   = Faker::Address.zip_code
      latitude   = Faker::Address.latitude
      longitude  = Faker::Address.longitude
      Surveyee.create!(first_name: first_name,
                        last_name: last_name,
                        age: age,
                        sex: sex,
                        email: email,
                        phone: phone,
                        city: city,
                        state: state,
                        country: country,
                        zip_code: zipcode,
                        latitude: latitude,
                        longitude: longitude )

    end

    50.times do |n|
      first_name = Faker::Name.first_name
      last_name  = Faker::Name.last_name
      phone   = Faker::Number.number(10)
      Agent.create!(first_name: first_name,
                    last_name: last_name,
                     phone: phone)
    end
  
   Result.populate(500) do |result|
      result.answer = ["a","b","c","d"]
      result.survey_id = 1..5
      result.mcq4_id = 1..10
      result.surveyee_id = 1..500
      result.agent_id = 1..50
    end

  Result.populate(500) do |result|
      result.answer = ["yes","no"]
      result.survey_id = 1..5
      result.ynq_id = 1..10
      result.surveyee_id = 1..500
      result.agent_id = 1..50
    end
  end
end
