Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "groups#index"
  resources :groups do
    resources :posts
  end  
  get "test" => "welcome#test"
  get "about", to: "welcome#about"
end
