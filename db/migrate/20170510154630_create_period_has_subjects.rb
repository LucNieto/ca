class CreatePeriodHasSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :period_has_subjects do |t|
      t.references :period, foreign_key: true
      t.references :teacher, foreign_key: true
      t.references :subject, foreign_key: true
      t.boolean :lunes
      t.boolean :martes
      t.boolean :miercoles
      t.boolean :jueves
      t.boolean :viernes
      t.boolean :sabado
      t.string :horario_clases

      t.timestamps
    end
  end
end
