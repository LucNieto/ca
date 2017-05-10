class Teacher < ApplicationRecord
  validates :nombre, :presence => true
  validates :apellido_paterno, :presence => true
  validates :grado, :presence => true
  validates :correo_electronico, :presence => true
end
