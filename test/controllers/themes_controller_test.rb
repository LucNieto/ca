require 'test_helper'

class ThemesControllerTest < ActionDispatch::IntegrationTest
  test "should get forms" do
    get themes_forms_url
    assert_response :success
  end

  test "should get tables" do
    get themes_tables_url
    assert_response :success
  end

end
