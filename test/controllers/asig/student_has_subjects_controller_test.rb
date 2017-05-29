require 'test_helper'

class Asig::StudentHasSubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get asig_student_has_subjects_index_url
    assert_response :success
  end

  test "should get new" do
    get asig_student_has_subjects_new_url
    assert_response :success
  end

  test "should get show" do
    get asig_student_has_subjects_show_url
    assert_response :success
  end

  test "should get edit" do
    get asig_student_has_subjects_edit_url
    assert_response :success
  end

end
