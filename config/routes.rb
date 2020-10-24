Rails.application.routes.draw do
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "top" => "tops#top"
  get "quiz" => "tops#quiz"
end
