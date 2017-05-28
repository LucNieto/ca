require 'test_helper'

class SchoolCycleHasSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_cycle_has_subject = school_cycle_has_subjects(:one)
  end

  test "should get index" do
    get school_cycle_has_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_school_cycle_has_subject_url
    assert_response :success
  end

  test "should create school_cycle_has_subject" do
    assert_difference('SchoolCycleHasSubject.count') do
      post school_cycle_has_subjects_url, params: { school_cycle_has_subject: { horario_clases: @school_cycle_has_subject.horario_clases, jueves: @school_cycle_has_subject.jueves, lunes: @school_cycle_has_subject.lunes, martes: @school_cycle_has_subject.martes, miercoles: @school_cycle_has_subject.miercoles, sabado: @school_cycle_has_subject.sabado, school_cycle_id: @school_cycle_has_subject.school_cycle_id, subject_id: @school_cycle_has_subject.subject_id, teacher_id: @school_cycle_has_subject.teacher_id, viernes: @school_cycle_has_subject.viernes } }
    end

    assert_redirected_to school_cycle_has_subject_url(SchoolCycleHasSubject.last)
  end

  test "should show school_cycle_has_subject" do
    get school_cycle_has_subject_url(@school_cycle_has_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_cycle_has_subject_url(@school_cycle_has_subject)
    assert_response :success
  end

  test "should update school_cycle_has_subject" do
    patch school_cycle_has_subject_url(@school_cycle_has_subject), params: { school_cycle_has_subject: { horario_clases: @school_cycle_has_subject.horario_clases, jueves: @school_cycle_has_subject.jueves, lunes: @school_cycle_has_subject.lunes, martes: @school_cycle_has_subject.martes, miercoles: @school_cycle_has_subject.miercoles, sabado: @school_cycle_has_subject.sabado, school_cycle_id: @school_cycle_has_subject.school_cycle_id, subject_id: @school_cycle_has_subject.subject_id, teacher_id: @school_cycle_has_subject.teacher_id, viernes: @school_cycle_has_subject.viernes } }
    assert_redirected_to school_cycle_has_subject_url(@school_cycle_has_subject)
  end

  test "should destroy school_cycle_has_subject" do
    assert_difference('SchoolCycleHasSubject.count', -1) do
      delete school_cycle_has_subject_url(@school_cycle_has_subject)
    end

    assert_redirected_to school_cycle_has_subjects_url
  end
end
