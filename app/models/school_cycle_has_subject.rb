class SchoolCycleHasSubject < ApplicationRecord
  belongs_to :school_cycle
  belongs_to :teacher
  belongs_to :subject

  has_many :students, through: :student_has_subjects, dependent: :destroy
end
