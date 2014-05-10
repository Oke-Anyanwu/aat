Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/meta', as: 'rails_admin'

  devise_for :superusers

  devise_for :employees
  resources :employees

  root "employees#index"
end
