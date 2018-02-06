json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :ingrediants, :instructions
  json.url recipe_url(recipe, format: :json)
end
