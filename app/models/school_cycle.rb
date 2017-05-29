class SchoolCycle < ApplicationRecord
  belongs_to :career
  has_many :periods
  has_many :school_cycle_has_subjects, dependent: :destroy

  validates :nombre_ciclo, presence: true
end
