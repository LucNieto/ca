Rails.application.routes.draw do
  
  resources :themes, only: [:index] do
    collection do # /themes/
      get 'forms'
      get 'tables'
      get 'ui'
      get 'widgets'
      get 'buttons'
    end
  end

  root 'interface#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
