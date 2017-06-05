class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.references :student_has_subject, foreign_key: true
      t.boolean :aplicar_parcial
      t.integer :grade_type
      t.float :calificacion

      t.timestamps
    end
  end
end
