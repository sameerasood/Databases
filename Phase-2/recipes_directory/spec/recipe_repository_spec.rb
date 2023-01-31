require 'recipe_repository'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipe_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  it "returns the list of all recipes" do
    repo = RecipeRepository.new

    recipe = repo.all
    expect(recipe.length).to eq 2 # =>  2
    expect(recipe.first.id).to eq '1' # =>  1
    expect(recipe.first.recipe_name).to eq 'Okra' # =>  'Okra'
    expect(recipe.first.rating).to eq '3' # =>  3
  end

  it 'returns the second recipe from the list' do
    repo = RecipeRepository.new
    recipe = repo.find(2)
    expect(recipe.recipe_name).to eq 'Chicken salad' #=> 'Chicken salad'
    expect(recipe.rating).to eq 2 #=> 2
  end
end