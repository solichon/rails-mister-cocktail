# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

Cocktail.destroy_all
Ingredient.destroy_all

ingredients_array = JSON.parse(open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)["drinks"]
ingredients = []
ingredients_array.each do |ingredient|
  ingredients << ingredient["strIngredient1"]
end

ingredients.each do |ingredient_name|
  Ingredient.create!(name: ingredient_name)
end

10.times do
  cocktail = Cocktail.new(
      name: Faker::Pokemon.name
    )
  cocktail.save
  3.times do
    dose = Dose.new(
        description: (2..10).to_a.sample.to_s + ["cl", "cuillère", "tranches"].sample,
        ingredient: Ingredient.all.sample,
        cocktail: cocktail
      )
    dose.save
  end
end
