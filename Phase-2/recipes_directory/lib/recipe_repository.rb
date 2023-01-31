require_relative './recipe'

class RecipeRepository
    def all
      sql = 'SELECT id, recipe_name, cooking_time, rating FROM recipes;'
      result = DatabaseConnection.exec_params(sql,[])
      recipes = []

      result.each do |record|
        recipe = Recipe.new
        recipe.id = record['id']
        recipe.recipe_name = record['recipe_name']
        recipe.cooking_time = record['cooking_time']
        recipe.rating = record['rating']
        recipes.push(recipe)
      end
      return recipes
    end

    def find(id)
    end
end