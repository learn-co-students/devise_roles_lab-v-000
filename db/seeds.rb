# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

michael = User.create(name:"Michael",email:"mdo5004@psu.edu",password:'password',role:2)
rachel = User.create(name:"Rachel",email:"rachelvoconnell@rochester.edu",password:'password',role:1)
ryan = User.create(name:"Ryan",email:"ryan@ryanomusic.com",password:"password",role:0)

michael.posts.create(content:"Admin here, let's keep it friendly")
rachel.posts.create(content:"New user here. Hey everyone!")
ryan.posts.create(content:"Welcome @rachel")
michael.posts.create(content:"Welcome @rachel")