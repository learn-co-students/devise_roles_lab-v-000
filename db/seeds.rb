# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

post1 = Post.new( content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vel ante et enim finibus tristique sit amet ornare dolor.")
post1.user_id = User.last.id,
post1.save

post2 = Post.new( content: "Vivamus in urna id lacus vehicula scelerisque ac et justo. Nullam bibendum fringilla augue vel dapibus. In vitae lectus ante.")
post2.user_id = User.last.id,
post2.save

post3 = Post.new( content: "Sed at sem quis risus volutpat mollis id et ipsum. Aliquam dapibus quam in semper pretium. In rhoncus augue rutrum nulla aliquet, at feugiat ipsum vulputate.")
post3.user_id = User.last.id,
post3.save