namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    supinos = Business.create!(name: "Supinos Pizza",
                 address: "2457 Russell St, Detroit, MI 48207",
                 email: "supinos@supinos.com",
                 password: "supinos",
                 password_confirmation: "supinos",
                 admin: true)
    15.times do
      menu_item_name = Faker::Lorem.word
      description = Faker::Lorem.sentence(5)
      price = 12.99
      photo = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
      supinos.menu_items.create!(name: menu_item_name, description: description, price: price, photo: photo)
    end
    address_array = ["18435 Plymouth Rd, Detroit, MI 48228",
                      "16835 E Warren Ave, Detroit, MI 48224",
                      "14420 W 7 Mile Rd, Detroit, MI 48235",
                      "15610 E 8 Mile Rd, Detroit, MI 48205",
                      "2941 S Telegraph Rd, Dearborn, MI 48124",
                      "13136 Michigan Ave, Dearborn, MI 48126",
                      "3401 Riopelle St, Detroit, MI 48207",
                      "21413 W 8 Mile Rd, Detroit, MI 48219",
                      "400 E Congress St, Detroit, MI 48226",
                      "2482 Clifford St, Detroit, MI 48201",
                      "2644 Harrison St, Detroit, MI 48216",
                      "16807 W Warren Ave, Detroit, MI 48228",
                      "20510 Livernois Ave, Detroit, MI 48221",
                      "18290 Livernois Ave, Detroit, MI 48221",
                      "18401 W 8 Mile Rd, Detroit, MI 48219"]
    14.times do |n|
      sleep 2
      name  = Faker::Company.name
      address = address_array[n]
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      business = Business.create!(name: name,
                   address: address,
                   email: email,
                   password: password,
                   password_confirmation: password)
      15.times do
        menu_item_name = Faker::Lorem.word
        description = Faker::Lorem.sentence(5)
        price = 12.99
        photo = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
        business.menu_items.create!(name: menu_item_name, description: description, price: price, photo: photo)
      end
    end
    #businesses = Business.all(limit: 15)
    #15.times do |n|
    #  name = Faker::Lorem.word
    #  description = Faker::Lorem.sentence(5)
    #  price = 12.99
    #  photo = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample(random: (Random.new_seed*n)%15))
    #  businesses.each { |business| business.menu_items.create!(name: name, description: description, price: price, photo: photo) }
    #end
  end
end