puts "Starting to run seeds file..."

100.times do |topic|
  Topic.create!(title: "My Title #{topic}")
end

puts "100 Topics created"

User.create!(
  email: "admin@test.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Jon",
  last_name: "Snow",
  username: "wallwatcher",
  role: "admin"
)

puts "Admin user created"

User.create!(
  email: "student@test.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Jon",
  last_name: "Snow",
  username: "youngwallwatcher",
  role: "student"
)

puts "Student user created"

50.times do |post|
  Post.create!(
    title: "My Post #{post}",
    content: "Some amazing content here",
    topic_id: Topic.last.id,
    user_id: User.last.id
  )
end

puts "50 posts were created"