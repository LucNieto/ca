require 'test_helper'

class Cat::SchoolCyclesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cat_school_cycles_index_url
    assert_response :success
  end

  test "should get new" do
    get cat_school_cycles_new_url
    assert_response :success
  end

  test "should get show" do
    get cat_school_cycles_show_url
    assert_response :success
  end

  test "should get edit" do
    get cat_school_cycles_edit_url
    assert_response :success
  end

end
