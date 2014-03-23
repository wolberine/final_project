namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Business.create!(name: "Supinos Pizza",
                 address: "2457 Russell St, Detroit, MI 48207",
                 email: "supinos@supinos.com",
                 password: "supinos",
                 password_confirmation: "supinos",
                 admin: true)

    address_array = ["18435 Plymouth Rd, Detroit, MI 48228",
                      "16835 E Warren Ave, Detroit, MI 48224",
                      "14420 W 7 Mile Rd, Detroit, MI 48235",
                      "15610 E 8 Mile Rd, Detroit, MI 48205",
                      "2941 S Telegraph Rd, Dearborn, MI 48124",
                      "13136 Michigan Ave, Dearborn, MI 48126"]
    6.times do |n|
      sleep 2
      name  = Faker::Company.name
      #address = Faker::Address.street_address+", "+Faker::Address.city+", "+Faker::Address.state_abbr+" "+Faker::Address.zip
      address = address_array[n]
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      Business.create!(name: name,
                   address: address,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    businesses = Business.all(limit: 3)
    100.times do
      name = Faker::Lorem.word
      description = Faker::Lorem.sentence(5)
      price = 12.99
      photo = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
      businesses.each { |business| business.menu_items.create!(name: name, description: description, price: price, photo: photo) }
    end
  end
end