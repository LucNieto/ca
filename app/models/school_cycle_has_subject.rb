class SchoolCycleHasSubject < ApplicationRecord
  belongs_to :school_cycle
  belongs_to :teacher
  belongs_to :subject
end
