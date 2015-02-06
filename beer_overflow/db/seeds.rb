# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

8.times do
  user = User.new(username: Faker::Internet.user_name, password: '1', email: Faker::Internet.email)

  2.times do
    user.questions << Question.create(title: Faker::Hacker.adjective, content: Faker::Hacker.say_something_smart)
  end
  user.save
end
