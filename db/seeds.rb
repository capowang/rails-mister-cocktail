# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'json'
require 'open-uri'

# Examples:
Ingredient.destroy_all if Rails.env.development?
Cocktail.destroy_all if Rails.env.development?

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)["drinks"]

for i in user do
  Ingredient.create!(name: i["strIngredient1"])
end

for i in (1..5) do
  Cocktail.create!(name: "Cocktail#{i}")
end
  #Name_of_model(like Restaurant).create!(x)




#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
