# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Seeding..."

5.times do
  Payment.create(
    name: "A Sample Payment",
    amount_cents: 2000,
    payment_at: Time.now,
    user_id: 1
  )
end

puts "Complete!"
