class Student < ApplicationRecord
  validates :matricula, presence: true
  validates :matricula, uniqueness: true
  validates :nombre, presence: true
  validates :apellido_paterno, presence: true
  validates :apellido_materno, presence: true
  validates :correo_electronico, presence: true

  has_many :school_cycle_has_subjects, through: :student_has_subjects, dependent: :destroy

  def nombre_completo
     "#{nombre} #{apellido_paterno} #{apellido_materno}"
  end
end
