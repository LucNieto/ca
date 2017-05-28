class Student < ApplicationRecord
  validates :matricula, presence: true
  validates :matricula, uniqueness: true
  validates :nombre, presence: true
  validates :apellido_paterno, presence: true
  validates :apellido_materno, presence: true
  validates :correo_electronico, presence: true

  def nombre_completo
     "#{nombre} #{apellido_paterno} #{apellido_materno}"
  end
end
