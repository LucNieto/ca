class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.references :student_has_subject, foreign_key: true
      t.integer :attendance_type
      t.date :fecha_asistencia

      t.timestamps
    end
  end
end
