namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Business.create!(name: "Supinos Pizza",
                 address: "2457 Russell St, Detroit, MI 48207",
                 email: "supinos@supinos.com",
                 password: "supinos",
                 password_confirmation: "supinos",
                 admin: true)
    99.times do |n|
      name  = Faker::Company.name
      address = Faker::Address.street_address+", "+Faker::Address.city+", "+Faker::Address.state_abbr+" "+Faker::Address.zip
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      Business.create!(name: name,
                   address: address,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    businesses = Business.all(limit: 6)
    50.times do
      name = Faker::Lorem.word
      description = Faker::Lorem.sentence(5)
      businesses.each { |business| business.menu_items.create!(name: name, description: description) }
    end
  end
end