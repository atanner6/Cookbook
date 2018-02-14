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

end