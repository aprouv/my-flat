# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying everything..."

Room.destroy_all

puts "everything destroyed!"

room_names = [
  "Salon",
  "Salle de bain",
  "Cuisine",
  "Chambre",
  "Dressing",
]

room_names.each do |room_name|
  puts "creating #{room_name}..."
  room_request = RestClient.get("https://source.unsplash.com/1200x700/?room")
  room = Room.new(
      name: room_name,
      banner_url: room_request.request.url
    )
  room.save!
  3.times do
    fourniture_request = RestClient.get("https://source.unsplash.com/400x300/?furniture")
    fourniture = Fourniture.new(
      name: Faker::House.furniture,
      image_url: fourniture_request.request.url
    )
    fourniture.room = room
    fourniture.save!
    sleep(2)
  end
  puts "#{room_name} created!"
end
