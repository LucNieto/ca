class Subject < ApplicationRecord
  enum subject_type: [ 'UNAM', 'UAA' ]
  belongs_to :group
end
