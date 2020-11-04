Rails.application.routes.draw do
  post 'kakutan_pdfs/index'
  devise_for :users
  resources :users, only: [:show]
  root :to => 'tops#home'
  get "quiz" => "tops#quiz"
  get "type" => "tops#type"
  get "kakutan" => "tops#kakutan"
  get "select" => "tops#select"
  post 'results' => "results#create"
  post "kakutan" => "tops#kakutan"
  post 'type/results' => "results#create_type"
  post 'word/json' => "word_sets#create"
  post 'translation' =>"translations#count"
  post "user" => "users#update"


  get '*path', controller: 'application', action: 'render_404'
end
