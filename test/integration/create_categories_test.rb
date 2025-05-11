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

    test "invalid category submission results in failure" do
      get new_category_url
      assert_response :success
    
      assert_no_difference 'Category.count' do
        post categories_url, params: { category: { name: " " } }
      end
      
      # This should now pass with the controller fix
      assert_response :unprocessable_entity
      
      # Verify error display
      assert_select 'div.card.border-danger' do
        assert_select 'h2.card-title', /error/i
        assert_select 'li', /can('|')t be blank/i
      end
    end
end
  