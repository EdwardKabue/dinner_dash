# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_properties = [["Rachel Warbelow","demo+rachel@jumpstartlab.com", "", "password", false],
["Jeff", "demo+jeff@jumpstartlab.com", "j3", "password", false],
["Jorge Tellez", "demo+jorge@jumpstartlab.com", "novohispano", "password", false]]

user_properties.each do |property|
	User.create(full_name:property[0] , email:property[1] , display_name:property[2] , password:property[3], password_confirmation: property[3], admin:property[4])
end

	
Category.find_or_create_by(title: "Salads")
Category.find_or_create_by(title: "Beverages")
Category.find_or_create_by(title: "Desserts")
Category.find_or_create_by(title: "Sandwiches")
Category.find_or_create_by(title: "Starters")

=begin
Item.create(title: "House Salad", description: "Romaine, iceberg, red cabbage, carrots, cucumbers, and cherry tomatoes.", price: 4.50, category_ids: [Category.find_by(title: "Salads").id])
Item.create(title: "Chicken Grilled Caeser Salad", description: "Romaine, parmesan and garlic croutons.", price: 9.50, category_ids: [Category.find_by(title: "Salads").id])
Item.create(title: "Black and Bleu Salad", description: "Grilled sirloin, greens, cucumber, tomato, red onion and blue cheese.", price: 10.95, category_ids: [Category.find_by(title: "Salads").id])
Item.create(title: "Greek Salad", description: "Mixed spring greens topped with kalamata olives, cucumber, pickled red onions with Greek dressing.", price: 7.95, category_ids: [Category.find_by(title: "Salads").id])
=end


