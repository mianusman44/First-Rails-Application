Rails.application.routes.draw do
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

