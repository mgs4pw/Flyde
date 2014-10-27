Rails.application.routes.draw do
  root to: 'visitors#home'
  devise_for :users
end
