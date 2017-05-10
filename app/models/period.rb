class Period < ApplicationRecord
  belongs_to :school_cycle
  enum period_type: ['1','2','3']

  validates :nombre_periodo, :presence => true
  validates :period_type,  :presence => true
end
