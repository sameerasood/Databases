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
      sql = 'SELECT recipe_name, cooking_time, rating FROM recipes WHERE id = $1'
      sql_params = [id]
      result = DatabaseConnection.exec_params(sql, sql_params)

      record = result[0]

      recipe = Recipe.new
      recipe.recipe_name = record['recipe_name']
      recipe.cooking_time = record['cooking_time']
      recipe.rating = record['rating']

      return recipe

    end
end