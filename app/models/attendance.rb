class Attendance < ApplicationRecord
  belongs_to :student_has_subject
  enum attendance_type: ['Asistio','Retardo','Falta', 'Justificante']

  validates :attendance_type,  :presence => true
end
