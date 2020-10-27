Rails.application.routes.draw do
  devise_for :users
  resources :users
  root :to => 'tops#home'
  get "top" => "tops#top"
  get "quiz" => "tops#quiz"
  get "kakutan" => "tops#kakutan"
  get "select" => "tops#select"
  post 'results' => "results#create"
end
