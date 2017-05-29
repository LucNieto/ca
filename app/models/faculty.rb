class Faculty < ApplicationRecord
  has_many :careers, dependent: :destroy
end
