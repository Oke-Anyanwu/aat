Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/meta', as: 'rails_admin'

  devise_for :superusers

  devise_for :employees
  resources :employees do
    resources :leaves
  end

  resources :events

  get "monthly_events" => "monthly_events#index", as: 'monthly_events'


  root "employees#index"
end
