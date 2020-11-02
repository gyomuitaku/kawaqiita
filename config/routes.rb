Rails.application.routes.draw do
  resources :tmps
  get 'welcome_page/welcome'   
  root 'welcome_page#welcome'
end
