require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "Bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "Ham Sandwich", summary: "Top Sandwich!", description: "Bread. Butter. Ham!. Cook!")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "ChefID must be associated with recipe" do
     @recipe.chef_id =  " "
    assert_not @recipe.valid?
  end
  
  
  test "name should be present" do
    @recipe.name =  " "
    assert_not @recipe.valid?
  end
  
  test "name length should more than 5 characters" do
    @recipe.name =  "a" * 4
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long 100" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "summary must be present" do
    @recipe.summary =  " "
    assert_not @recipe.valid?
  end
  
  test "summary  length should more than 10 characters" do
    @recipe.summary =  "a" * 9
    assert_not @recipe.valid?
  end
  
  test "summary  length should less than 150 characters" do
    @recipe.summary =  "a" * 151
    assert_not @recipe.valid?
  end
  
   test "description must be present" do
    @recipe.description =  " "
    assert_not @recipe.valid?
  end
  
  test "description  length should more than 20 characters" do
    @recipe.description =  "a" * 19
    assert_not @recipe.valid?
  end
  
  test "description  length should less than 500 characters" do
    @recipe.description =  "a" * 501
    assert_not @recipe.valid?
  end
  
  

  
  
  
end