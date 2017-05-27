class Student < ApplicationRecord
  validates :matricula, :uniqueness =>true
end
