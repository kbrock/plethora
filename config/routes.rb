Rails.application.routes.draw do
  resources :words

  root :to => "phrase#index"
end
