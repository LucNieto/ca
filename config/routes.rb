Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'

  resources :themes, only: [:index] do
    collection do # /themes/
      get 'forms'
      get 'tables'
      get 'ui'
      get 'widgets'
      get 'buttons'
    end
  end

  resources :interface, only: [:index]

  namespace :cat do
    resources :students
    resources :school_cycles
    resources :teachers
    resources :periods
  end

  namespace :asig do
    resources :school_cycle_has_subjects
  end
end
