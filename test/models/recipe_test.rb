require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
 
test "creates a valid record" do
  recipe = Recipe.new
  recipe.title = "Ice Water"
  recipe.ingredients = ["one glass", "water", "ice"].join("<br>")
  recipe.instructions = "Combine all ingredients into the glass and letsit for two minutes. Serve Immediatly"
  assert recipe.save
end

test "should not save unles title is filled in" do
  recipe = Recipe.new
  assert !recipe.save #Should Fail.
  assert recipe.errors[:title].include?("can't be blank")
end

test "should not save unless ingredients are present" do
  recipe = Recipe.new
  assert !recipe.save #Should Fail.
  assert recipe.errors[:ingredients].include?("can't be blank")
end

test "should not save unless instructions are present" do
  recipe = Recipe.new
  assert !recipe.save #Should Fail.
  assert recipe.errors[:instructions].include?("can't be blank")
end

test "should find a match on title" do  test_recipe = Recipe.create(title: "Cake",                              
  ingredients: "Flour, sugar, eggs.", instructions: "Mix ingredients...")  
  assert_equal test_recipe, Recipe.find_all_by_query("cake").first 
end

test "should find 2 matches on title" do  
   Recipe.create!(title: "Cake", ingredients: "Flour, sugar, eggs.", instructions: "Mix ingredients...") 
   Recipe.create!(title: "Pancakes", ingredients: "flour, butter, eggs.",instructions: "Mix ingredients in a large bowl...")  
   assert_equal 2, Recipe.find_all_by_query("cake").count 
end

test "should find a match on ingredients" do  
  test_recipe = Recipe.create(title: "Cake", ingredients: "Flour, sugar, eggs.",instructions: "Mix ingredients...")  
  assert_equal test_recipe, Recipe.find_all_by_query("flour").first
end


test "should find a match on instructions" do  
  test_recipe = Recipe.create(title: "Cake", ingredients: "Flour, sugar, eggs.", instructions: "Mix ingredients...")  
  assert_equal test_recipe, Recipe.find_all_by_query("mix").first 
end




end