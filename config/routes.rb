Rails.application.routes.draw do
  devise_for :users
  root "static_pages#root"
  get '/pricing', to: 'pricing#index'
end
