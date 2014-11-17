Rails.application.routes.draw do
  
  root to: 'visitors#home'
  
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions'}

  get '/provinces', to: 'provinces#get_by_country', as: 'provinces'

  get '/company', to: 'companies#dashboard', as: 'company_dashboard'

  get '/student', to: 'students#dashboard', as: 'student_dashboard'
  post '/student/update_profile', to: 'students#update_profile', as: 'update_student_profile'
  post '/student/experience', to: 'students#create_experience', as:'create_student_experience'
  delete '/student/:id/experience', to: 'students#destroy_experience', as: 'destroy_student_experience'

  post '/student/skill', to: 'students#create_skill', as:'create_student_skill'
  delete '/student/:id/skill', to: 'students#destroy_skill', as: 'destroy_student_skill'

  get '/company/profile', to: 'companies#profile', as: 'company_profile'
  post '/company/profile', to: 'companies#update_profile', as: 'company_profile_update'
  post '/company/position', to: 'companies#position', as: 'company_position'
  delete '/company/:id/position', to: 'companies#destroy_position', as: 'company_position_destroy'

end
