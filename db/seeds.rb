user = User.new(


  email: "nicolas.eymenier@gmail.com",
  admin: true,
  password:  'SwimBlog',
  password_confirmation: 'SwimBlog',
)

user.save!
puts "Creating admin"
