class WelcomeController < ApplicationController
  layout 'login'
  helper_method :resource_name, :resource, :devise_mapping

  def index
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end