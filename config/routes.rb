Rails.application.routes.draw do
  
  root to: 'visitors#home'
  
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions'}

  get '/provinces', to: 'provinces#get_by_country', as: 'provinces'
  
end
