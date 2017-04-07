class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  private
    def after_sign_in_path_for(resource)
      interface_index_path
    end

  protected
    def layout_by_resource
      if devise_controller?
        "login"
      else
        "application"
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:nombre, :apellido_paterno, :apellido_materno, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.permit(:sign_in) do |user_params|
        user_params.permit(:nombre, :apellido_paterno, :apellido_materno, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.permit(:account_update) do |user_params|
        user_params.permit(:nombre, :apellido_paterno, :apellido_materno, :email, :password, :password_confirmation)
      end
    end
end
