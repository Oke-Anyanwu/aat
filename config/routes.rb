Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/meta', as: 'rails_admin'

  devise_for :superusers

  devise_for :employees
  namespace :employees do
    get "events/monthly" => "monthly_events#index"
    resources :events
  end
  resources :employees

  root "employees#index"
end
