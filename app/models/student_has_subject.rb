class StudentHasSubject < ApplicationRecord
  attr_accessor :school_cycle, :subject
  # Custom fields
  enum student_type: [:Normal,:Repetidor]
  
  # Assosiations
  belongs_to :school_cycle_has_subject
  belongs_to :student
end
