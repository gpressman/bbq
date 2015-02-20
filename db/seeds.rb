# Seed Barbecues
10.times do
  title = [ "#{Faker::Team.name} victory BBQ", "#{Faker::Name.name} Birthday BBQ" ].sample
  venue = [ Faker::Address.city, Faker::Company.name ].sample

  puts "Creating #{title} at #{venue}"
  Barbecue.create(date: Faker::Date.forward(23), title: title, venue: venue)
end

10.times do
	user= User.new(name: Faker::Name.name, email: Faker::Internet.email, password: "password")
	if !user.save
		puts user.errors.full_messages
	end
end