# User.create(first_name: "John", last_name: "Messina", email: "jmessina@gmail.com", user_name: "john123", admin: true, password: "password", password_confirmation: "password")
# User.create(first_name: "Keith", last_name: "Batza", email: "kbatza@gmail.com", user_name: "keith123", password: "password", password_confirmation: "password")
# User.create(first_name: "Allan", last_name: "Stein", email: "astein@gmail.com", user_name: "allan123", password: "password", password_confirmation: "password")
Trip.create(user_id: 1, trip_type: "pleasure", destination: "Barcelona, Spain", begin_date: "2017-12-01", end_date: "2017-12-31", budget: 5000, description: "I want to go to Barcelona", wish_list: "Gaudi Church")
# Profile.create(user_id: User.first.id, age: 44, location: "Yonkers, NY", bio: "Chemist learning to code.")
# Friendship.create(user_id: User.first.id, friend_id: User.second.id)