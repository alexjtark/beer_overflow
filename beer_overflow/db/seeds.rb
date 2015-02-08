# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

titles = ["is bud light with lime beer?", "Canadian beer vs American beer", "When does beer become malt liquor?", "What is the difference between ales and lagers?", "How did Indian Pale Ales get their name?" ]

answers = ["Simply put, top fermenting yeast float to the top and bottom fermenting yeast sink towards the bottom. Top fermenting yeast like it much warmer. Around room temperature. This works the best for brewing if you are a home brewer. This produces ale style beers. Bottom fermenting yeasts are used to produce lager style brews.This type of yeast likes cooler temperatures. This yeast is used to brew styles such as Pilsners and Bocks.", "Ice beer involves lowering the temperature until ice starts to form then filtering it to get rid of the ice. With the reduction of water this makes ice beer more potent.", "You can indeed drink old beer but only depending on the beer's alcohol content. Otherwise, you run the risk of making yourself ill"]

contents = ["yes, absolutely", "no way, you shouldn't even be drinking beer", "maybe, check out this question for better result"]

10.times do
  user = User.create(username: Faker::Internet.user_name, password: '123', email: Faker::Internet.email)
end

5.times do
  Question.create(title: titles.sample, content: contents.sample, asker_id: (rand(5) + 1))
end



# alias beer="rake db:drop && rake db:create && rake db:migrate"