Rails.application.routes.draw do

  resources :topics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users, controllers: {registrations: 'registrations'}
  root to: 'static#home'
end
