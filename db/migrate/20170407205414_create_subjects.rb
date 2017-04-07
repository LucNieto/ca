class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.references :group, foreign_key: true
      t.string :nombre_materia
      t.integer :subject_type
      t.string :clave_materia

      t.timestamps
    end
  end
end
