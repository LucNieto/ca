class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum user_type: [ 'Sin asignar', 'Superuser', 'Administrador', 'Maestro', 'Alumno' ]
  
  def nombre_usuario
    "#{nombre} #{apellido_paterno} #{apellido_materno}"
  end
end
