require_relative './recipe'

class RecipeRepository

  def all
    # Executes the SQL query:
    # SELECT id, recipe_name, average_cooking_time, rating FROM recipes;
    recipes = []
    sql = 'SELECT id, recipe_name, average_cooking_time, rating FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      recipe = Recipe.new

      recipe.id = record['id']
      recipe.recipe_name = record['recipe_name']
      recipe.average_cooking_time = record['average_cooking_time']
      recipe.rating = record['rating']

      recipes << recipe
    end
      return recipes
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, recipe_name, average_cooking_time, rating FROM recipes WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]

    recipe = Recipe.new
    recipe.id = record['id']
    recipe.recipe_name = record['recipe_name']
    recipe.average_cooking_time = record['average_cooking_time']
    recipe.rating = record['rating']

    return recipe

    # Returns a single Recipe object.
  end
  
end