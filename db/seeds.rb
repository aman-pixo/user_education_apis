require 'faker'
# Random Years for passing Year.
def random_date_in_year(year)
  return rand(Date.civil(year.min, 1, 1)..Date.civil(year.max, 12, 31)) if year.kind_of?(Range)
  rand(Date.civil(year, 1, 1)..Date.civil(year, 12, 31))
end

puts "***Attention seed is running...***"
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
puts "create 10 random users"

30.times{
  user = User.create(full_name: Faker::Name.name, gender:Faker::Gender.binary_type, dob:Faker::Date.birthday(min_age: 18, max_age: 65), address: Faker::Address.full_address)
  puts "#{user.full_name} is created"
}
puts "create 10 random users"

User.pluck(:id).each do |user_id|
  3.times {
    Education.create(course_name: Faker::Educator.course_name, board: Faker::Educator.secondary_school, percentage: "#{rand(50..100)} %"        , passing_year: random_date_in_year(2010..2022), branch:Faker::Educator.degree, user_id: user_id)
    puts "#{User.find_by(id: user_id).full_name}'s education is created"
  }
end