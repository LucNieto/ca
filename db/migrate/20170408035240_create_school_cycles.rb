class CreateSchoolCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :school_cycles do |t|
      t.references :career, foreign_key: true
      t.string :nombre_ciclo

      t.timestamps
    end
  end
end
