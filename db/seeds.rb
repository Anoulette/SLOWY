User.destroy_all
Vehicle.destroy_all


u1 = User.create!(first_name: "Gaëlle", last_name: "Ozanon", email: "gaelle@toto.com", password: "123456")
u2 = User.create!(first_name: "Anoula", last_name: "Croville", email: "anoula@toto.com", password: "123456")
u3 = User.create!(first_name: "Emmanuel", last_name: "Landron", email: "emmanuel@toto.com", password: "123456")

v1 = Vehicle.create!(vehicle_type: "bike", price: 30, details: "Superbe vélo à louer au centre de Lyon", name: "Vélo de compétition", user: u1)
v2 = Vehicle.create!(vehicle_type: "e-bike", price: 20, details: "Superbe trottinette à louer au centre de Lyon", name: "Trott' de compétition", user: u1)
v3 = Vehicle.create!(vehicle_type: "overboard", price: 40, details: "Superbe overboard à louer au centre de Lyon", name: "Overboard de compétition", user: u3)
