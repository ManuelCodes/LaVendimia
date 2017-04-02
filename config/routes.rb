Rails.application.routes.draw do
  resources :configuracions
  resources :articulos
  resources :clientes
  get '/main_page/index'
  get 'ventas/new', to: 'ventas#new'
  post 'ventas',    to: 'ventas#create'
  #get '/configuracions/:id/edit', to: 'configuracion#edit', as: :configuracion
  #post '/configuracions/:id', to: 'configuracion#create', as: :configuracions
  #patch '/configuracions/:id', to: 'configuracion#create'
  #patch '/configuracions/:id', to: 'configuracion#update', as: :configuracions
  #configuracions_path

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
