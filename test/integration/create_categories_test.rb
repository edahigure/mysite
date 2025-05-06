require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    test "get new category form and create category" do
      get new_category_path
      assert_response :success
      assert_select "form[action=?]", categories_path
  
      assert_difference 'Category.count', 1 do
        post categories_path, params: { category: { name: "sports" } }
      end
  
      follow_redirect!
      assert_response :success
      assert_match "sports", response.body
    end
end
  