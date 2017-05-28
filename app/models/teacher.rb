class Teacher < ApplicationRecord
  validates :nombre, :presence => true
  validates :apellido_paterno, :presence => true
  validates :grado, :presence => true
  validates :correo_electronico, :presence => true

  def nombre_completo
     "#{nombre} #{apellido_paterno} #{apellido_materno}"
  end
end
