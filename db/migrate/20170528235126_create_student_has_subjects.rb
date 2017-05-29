class CreateStudentHasSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :student_has_subjects do |t|
      t.references :school_cycle_has_subject, foreign_key: true
      t.references :student, foreign_key: true
      t.integer :student_type

      t.timestamps
    end
  end
end
