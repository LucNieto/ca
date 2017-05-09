class Period < ApplicationRecord
  belongs_to :school_cycle
  enum period_type: ['1','2','3']

end
