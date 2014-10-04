Rails.application.routes.draw do
  resources :sentences
  resources :words

  root :to => "phrases#index"
end
