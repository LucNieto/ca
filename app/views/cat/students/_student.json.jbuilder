json.extract! student, :id, :matricula, :nombre, :apellido_paterno, :apellido_materno, :correo_electronico, :direccion, :telefono, :nombre_tutor, :telefono_tutor, :correo_tutor, :created_at, :updated_at
json.url student_url(student, format: :json)
