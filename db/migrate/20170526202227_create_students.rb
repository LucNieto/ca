class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :matricula
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :correo_electronico
      t.string :direccion
      t.string :telefono
      t.string :nombre_tutor
      t.string :telefono_tutor
      t.string :correo_tutor

      t.timestamps
    end
  end
end
