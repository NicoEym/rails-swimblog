
Post.delete_all
User.delete_all

user = User.new(


  email: "nicolas.eymenier@gmail.com",
  admin: true,
  password:  'SwimBlog',
  password_confirmation: 'SwimBlog',
)

user.save!
puts "Creating admin"


SwimType.create(name: "Swim for Fun")
SwimType.create(name: "Workout")
SwimType.create(name: "Swim Race")
