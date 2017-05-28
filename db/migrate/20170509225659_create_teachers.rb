class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :grado
      t.string :correo_electronico
      t.string :telefono

      t.timestamps
    end
  end
end
