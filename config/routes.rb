Rails.application.routes.draw do
  resources :clientes
  get 'main_page/index'

  #devise_for :users, controllers: {
  #	sessions: "users/sessions#new",
  #    sessions: 'users/sessions',
  #    passwords: 'users/passwords',
  #    registrations: 'users/registrations'
  #}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: "home#index"

#devise_scope :user do
#  root to: "devise/sessions#new"
#end
#devise_scope :user do
#get '/resource/sign_in', to: 'users/sessions#new'
#end
devise_for :users
#root to:  '/users/sign_in', to: 'devise/sessions#new'
#root :to => "devise/sessions#new"
root :to => redirect("/users/sign_in")
end
