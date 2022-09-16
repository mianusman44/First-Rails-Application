Rails.application.routes.draw do

  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    registrations: 'admin_users/registrations',
    passwords: 'admin_users/passwords',
  }

  resources :posts do
  	resources :comments
  end

  resources :recipes
  resources :projects
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'welcome#index'

# resources :teachers

namespace :admin do
  resources :teachers
get 'dashboard' => 'dashboard#index'

end


end

