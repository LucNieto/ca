class Grade < ApplicationRecord
  # virtual attributes
  attr_accessor :student, :subject
  
  belongs_to :student_has_subject
  enum grade_type: ['Departamental A', 'Departamental B', 'Parcial', 'Final A', 'Final B', 'Promedio Final']
  validates :student_has_subject_id, uniqueness: { scope: :grade_type }
end
