class SchoolCycle < ApplicationRecord
  belongs_to :career
  has_many :periods

  validates :nombre_ciclo, presence: true
end
