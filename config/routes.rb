Rails.application.routes.draw do
  resources :commands, only: [:new, :create]
end
