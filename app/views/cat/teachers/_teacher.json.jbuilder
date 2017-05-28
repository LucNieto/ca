json.extract! teacher, :id, :nombre, :apellido_paterno, :apellido_materno, :grado, :correo_electronico, :telefono, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
