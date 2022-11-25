User.destroy_all
Vehicle.destroy_all

data = YAML.load_file('seed.yml').deep_symbolize_keys()


data[:users].each do |user_data|
  User.create!(user_data)
end

data[:vehicles].each do |vehicle_data|
  vehicle_data[:user_id] = User.find_by(email: vehicle_data[:user_id]).id
  photo_file = vehicle_data.delete(:photo_file)
  v = Vehicle.create!(vehicle_data)
  v.photo.attach(io: File.open("seed_images/#{photo_file}"), filename: photo_file)

end



# u1 = User.create!(first_name: "Gaëlle", last_name: "Ozanon", email: "gaelle@toto.com", password: "123456")
# u2 = User.create!(first_name: "Anoula", last_name: "Croville", email: "anoula@toto.com", password: "123456")
# u3 = User.create!(first_name: "Emmanuel", last_name: "Landron", email: "emmanuel@toto.com", password: "123456")
# u4 = User.create!(first_name: "Emma", last_name: "Landron", email: "emmanuel@tota.com", password: "123457")

# v1 = Vehicle.create!(vehicle_type: "bike", price: 30, details: "Superbe vélo à louer au centre de Lyon", name: "Vélo de compétition", user: u1)
# v2 = Vehicle.create!(vehicle_type: "e-bike", price: 20, details: "Superbe trottinette à louer au centre de Lyon", name: "Trott' de compétition", user: u1)
# v3 = Vehicle.create!(vehicle_type: "overboard", price: 40, details: "Superbe overboard à louer au centre de Lyon", name: "Overboard de compétition", user: u3)
# v4 = Vehicle.create!(vehicle_type: "overboard", price: 40, details: "Superbe overboard à louer au centre de Lyon", name: "Overboard de compétition", user: u4, street_number: 3, street: "rue loi", zipcode: "69001", city: "Marseille")
