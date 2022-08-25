require 'recipe_repository'

RSpec.describe RecipeRepository do

  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end

  describe RecipeRepository do
    before(:each) do 
    reset_recipes_table
  end

  it "returns all recipe data" do
    repo = RecipeRepository.new
    recipes = repo.all
    
    expect(recipes.length).to eq 2
    expect(recipes[0].id).to eq '1'
    expect(recipes[0].recipe_name).to eq 'Spag Bol'
    expect(recipes[0].average_cooking_time).to eq '25'
    expect(recipes[0].rating).to eq '4'

    expect(recipes[1].id).to eq '2'
    expect(recipes[1].recipe_name).to eq 'Steak and Chips'
    expect(recipes[1].average_cooking_time).to eq '25'
    expect(recipes[1].rating).to eq '5'
  end

  it "returns a single recipe with id 1" do
    repo = RecipeRepository.new

    recipe = repo.find(1)

    expect(recipe.id).to eq '1'
    expect(recipe.recipe_name).to eq 'Spag Bol'
    expect(recipe.average_cooking_time).to eq '25'
    expect(recipe.rating).to eq '4'
  end
end
end