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
	User.create(full_name:property[0] , email:property[1] , display_name:property[2] , password:property[3], admin:property[4] )
end



