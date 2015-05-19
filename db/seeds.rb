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

#Salads
category_1 = Category.find_by(title: "Salads")
item_properties_1 = [["House Salad", "Romaine, iceberg, red cabbage, carrots, cucumbers, and cherry tomatoes.", 4.50],
["Chicken Grilled Caeser Salad", "Romaine, parmesan and garlic croutons.", 9.50],
["Black and Bleu Salad", "Grilled sirloin, greens, cucumber, tomato, red onion and blue cheese.", 10.95],
["Greek Salad", "Mixed spring greens topped with kalamata olives, cucumber, pickled red onions with Greek dressing.", 7.95]]

item_properties_1.each do |property|
	item = Item.new(title: property[0], description: property[1] , price: property[2])
	item.category_ids << category_1.id
	item.save
end

 #Beverages
category_2 = Category.find_by(title: "Beverages")
item_properties_2 = [["Coffee", "Regular or Decaf.", 1.25],
["Smoothie", "Strawberry, mixed berry.", 5.50]]

item_properties_2.each do |property|
	item = Item.new(title: property[0], description: property[1] , price: property[2])
	item.category_ids << category_2.id
	item.save
end

#Desserts
category_3 = Category.find_by(title: "Desserts")
item_properties_3 = [["Belgian waffle", "Served with vanilla ice cream, fresh strawberries, and chocolate sauce", 6.25],
["Ice cream", "Vanilla, chocolate or strawberry.", 3],
["Cookies and cream", "Vanilla ice cream, oreo crumbs, chocolate sauce, whipped cream and cherry.", 7]]

item_properties_3.each do |property|
	item = Item.new(title: property[0], description: property[1] , price: property[2])
	item.category_ids << category_3.id
	item.save
end

#Sandwiches
category_4 = Category.find_by(title: "Sandwiches")
item_properties_4 = [["Pulled pork", "Served with tangy barbecue sauce on an onion knot.", 9.50],
["Turkey club", "Roasted turkey breast, bacon, lettuce, avocado", 8],
["Reuben", "Corned beef, melted swiss, sauerkraut, and thousand island on marbled rye.", 7.95]]

item_properties_4.each do |property|
	item = Item.new(title: property[0], description: property[1] , price: property[2])
	item.category_ids << category_4.id
	item.save
end

#Starters
category_5 = Category.find_by(title: "Starters")
item_properties_5 = [["Honey Glazed Onion Rings", "Sweet vidalia onions, deep fried in butter, glazed with thyme honey.", 6.50],
["Fried Calamari", "Served with house-made marinara and salad greens.", 8.75],
["Ancho Chile Shrimp Tacos", "Served with mango salsa, jalapeno-lime, creme fraiche, guacamole and shredded cabbage.", 8.50],
["Grilled Artichoke", "Served with sliced baguette and garlic aioli.", 7.75]]

item_properties_5.each do |property|
	item = Item.new(title: property[0], description: property[1] , price: property[2])
	item.category_ids << category_5.id
	item.save
end