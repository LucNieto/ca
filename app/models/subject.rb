class Subject < ApplicationRecord
  enum subject_type: [ 'UNAM', 'UAA' ]
  belongs_to :group
  has_many :school_cycle_has_subjects, dependent: :destroy
end
