Rails.application.routes.draw do
  
  root to: 'visitors#home'
  
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions'}

  get '/provinces', to: 'provinces#get_by_country', as: 'provinces'

  get '/company_dashboard', to: 'companies#dashboard', as: 'company_dashboard'

  get '/student_dashboard', to: 'students#dashboard', as: 'student_dashboard'
  post '/student/update_profile', to: 'students#update_profile', as: 'update_student_profile'
  post '/student/create_experience', to: 'students#create_experience', as:'create_student_experience'
  
end
