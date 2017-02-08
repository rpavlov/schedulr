# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create([{name: "Nanny"}, {name: "Parent"}])
User.create([
              {name: "Bob", email:"bob@123.com", password:"12345678", password_confirmation: "12345678",roles: [Role.first]},
              {name: "Jill", email:"jill@123.com",password:"12345678", password_confirmation: "12345678", roles: [Role.first]},
              {name: "Bill",  email:"bill@123.com",password:"12345678", password_confirmation: "12345678", roles: [Role.last]}
            ])

Listing.create([
                 {users: [User.first], description:"List1", start_at: DateTime.new, end_at: 100.days.from_now, price:1235},
                 {users: [User.first], description:"List2", start_at: DateTime.new, end_at: 5.days.from_now, price:10000},
                 {users: [User.last], description:"List3", start_at: DateTime.new, end_at: 10.days.from_now, price:100}
               ])

