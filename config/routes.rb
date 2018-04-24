Rails.application.routes.draw do
  root 'users#new'
  post '/register' => 'users#register'
  post 'login' => 'users#login'
  get 'groups' => 'groups#groups'
  delete '/logout' => 'users#logout'
  post 'groups/create' => 'groups#create'
  delete '/groups/:group_id/destroy' => 'groups#destroy'
  get '/groups/:group_id' => 'groups#show'
  post '/groups/:group_id/join' => 'groups#join'
  post '/groups/:group_id/unjoin' => 'groups#unjoin'



  
end
