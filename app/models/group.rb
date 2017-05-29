class Group < ApplicationRecord
  has_many :subjects, dependent: :destroy
end
