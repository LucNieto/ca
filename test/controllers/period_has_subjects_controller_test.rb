require 'test_helper'

class PeriodHasSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @period_has_subject = period_has_subjects(:one)
  end

  test "should get index" do
    get period_has_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_period_has_subject_url
    assert_response :success
  end

  test "should create period_has_subject" do
    assert_difference('PeriodHasSubject.count') do
      post period_has_subjects_url, params: { period_has_subject: { horario_clases: @period_has_subject.horario_clases, jueves: @period_has_subject.jueves, lunes: @period_has_subject.lunes, martes: @period_has_subject.martes, miercoles: @period_has_subject.miercoles, period_id: @period_has_subject.period_id, sabado: @period_has_subject.sabado, subject_id: @period_has_subject.subject_id, teacher_id: @period_has_subject.teacher_id, viernes: @period_has_subject.viernes } }
    end

    assert_redirected_to period_has_subject_url(PeriodHasSubject.last)
  end

  test "should show period_has_subject" do
    get period_has_subject_url(@period_has_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_period_has_subject_url(@period_has_subject)
    assert_response :success
  end

  test "should update period_has_subject" do
    patch period_has_subject_url(@period_has_subject), params: { period_has_subject: { horario_clases: @period_has_subject.horario_clases, jueves: @period_has_subject.jueves, lunes: @period_has_subject.lunes, martes: @period_has_subject.martes, miercoles: @period_has_subject.miercoles, period_id: @period_has_subject.period_id, sabado: @period_has_subject.sabado, subject_id: @period_has_subject.subject_id, teacher_id: @period_has_subject.teacher_id, viernes: @period_has_subject.viernes } }
    assert_redirected_to period_has_subject_url(@period_has_subject)
  end

  test "should destroy period_has_subject" do
    assert_difference('PeriodHasSubject.count', -1) do
      delete period_has_subject_url(@period_has_subject)
    end

    assert_redirected_to period_has_subjects_url
  end
end
