# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
              {name: "Bob", email:"123@123.com" },
              {name: "Jill", email:"123@123.com" },
              {name: "Bill",  email:"123@123.com"}
            ])
Listing.create([
                 {user: User.first, description:"List1", available_at: 100.days.from_now, price:1235},
                 {user: User.first, description:"List2", available_at: 5.days.from_now, price:10000},
                 {user: User.last, description:"List3", available_at: 10.days.from_now, price:100}
               ])
Role.create([{name: "Nanny"}, {name: "Parent"}
            ])
