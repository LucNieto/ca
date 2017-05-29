require 'faker'
include Faker

# Creación de usuario inicial
User.create!(
  email: 'uziel.trujillo@gmail.com',
  password: 'adivinaadivinadorXD',
  encrypted_password: '$2a$10$aLGWt1IAsIPLelseWdCv1e9QF8dt/D82JGEVsfZcLhqLuLJDi9o5u',
  nombre: 'Uziel',
  apellido_paterno: 'Trujillo',
  apellido_materno: 'Colón',
  user_type: 1,
)

# Insercion de Facultades
facultades = [ 'Facultad de Psicología', 'Facultad de Administración, Contaduría, Turismo, Gastronomía y Nutrición', 'Facultad de Comunicación y Relaciones Públicas', 'Facultad de Arquitectura e Ingenería', 'Facultad de Derecho', 'Centro de Lenguas Extranjeras' ]

facultades.each do |f|
  Faculty.create!(
    nombre_facultad: f
  )
end

# Insercción Carreras
Career.create!(faculty_id: 1, nombre_carrera: 'Licenciatura en Psicología', nombre_abbr: '')

Career.create!(faculty_id: 2, nombre_carrera: 'Profesional Asociado en Gastronomía', nombre_abbr: '')
Career.create!(faculty_id: 2, nombre_carrera: 'Licenciatura en Administración', nombre_abbr: '')
Career.create!(faculty_id: 2, nombre_carrera: 'Licenciatura en Contaduría', nombre_abbr: '')
Career.create!(faculty_id: 2, nombre_carrera: 'Licenciatura en Administración de Empresas Turisticas', nombre_abbr: '')
Career.create!(faculty_id: 2, nombre_carrera: 'Licenciatura en Gastronomía', nombre_abbr: '')
Career.create!(faculty_id: 2, nombre_carrera: 'Licenciatura en Nutricíon', nombre_abbr: '')
Career.create!(faculty_id: 2, nombre_carrera: 'Maestría en Finanzas', nombre_abbr: '')
Career.create!(faculty_id: 2, nombre_carrera: 'Maestría en Administración', nombre_abbr: '')
Career.create!(faculty_id: 2, nombre_carrera: 'Maestría en nuevas tecnologías aplicadas a la educación', nombre_abbr: '')
Career.create!(faculty_id: 2, nombre_carrera: 'Doctorado en Administración', nombre_abbr: '')

Career.create!(faculty_id: 3, nombre_carrera: 'Licenciatura en comunicación y relaciones públicas', nombre_abbr: '')
Career.create!(faculty_id: 3, nombre_carrera: 'Maestría en comunicación organizacional', nombre_abbr: '')

Career.create!(faculty_id: 4, nombre_carrera: 'Ingenería en computación', nombre_abbr: '')
Career.create!(faculty_id: 4, nombre_carrera: 'Licenciatura en Arquitectura', nombre_abbr: '')

Career.create!(faculty_id: 5, nombre_carrera: 'Licenciatura en Derecho', nombre_abbr: '')
Career.create!(faculty_id: 5, nombre_carrera: 'Maestría en Derecho Constitucional', nombre_abbr: '')
Career.create!(faculty_id: 5, nombre_carrera: 'Maestría en Derecho Constitucional y Electoral', nombre_abbr: '')
Career.create!(faculty_id: 5, nombre_carrera: 'Maestría en Derecho Judicial', nombre_abbr: '')

Career.create!(faculty_id: 6, nombre_carrera: 'Centro de Lenguas Extranjeras', nombre_abbr: '')

# Insercion de Grupos
grupos = [ '1010', '2010', '3010', '4010', '5010', '6010', '7010', '8010', '9010' ]
grupos.each do |g|
  Group.create!(clave_grupo: g)
end

# Insercion de Materias
Subject.create!(group_id: 1,nombre_materia: 'Taller de Programación I', subject_type: 1, clave_materia: 'A001')
Subject.create!(group_id: 2,nombre_materia: 'Taller de Programación II', subject_type: 1, clave_materia: 'A002')
Subject.create!(group_id: 4,nombre_materia: 'Algoritmos y Estructura de Datos', subject_type: 0, clave_materia: '1422')
Subject.create!(group_id: 5,nombre_materia: 'Ingenieria de Software', subject_type: 0, clave_materia: '1553')
Subject.create!(group_id: 6,nombre_materia: 'Lenguajes de Programación', subject_type: 0, clave_materia: '1671')
Subject.create!(group_id: 6,nombre_materia: 'Lenguajes y Automatas', subject_type: 0, clave_materia: '1670')
Subject.create!(group_id: 9,nombre_materia: 'Computo de alto desempeño', subject_type: 0, clave_materia: '0676')

# Creando grupos para administración
grupos = [ '1020', '2020', '3020', '4020', '5020', '6020', '7020', '8020', '9020' ]
grupos.each do |g|
  Group.create!(clave_grupo: g)
end

Subject.create!(group_id: 10,nombre_materia: 'Administración basica', subject_type: 0, clave_materia: '1176')
Subject.create!(group_id: 10,nombre_materia: 'La actividad empresarial', subject_type: 0, clave_materia: '1177')
