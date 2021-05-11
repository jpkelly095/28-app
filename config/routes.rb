Rails.application.routes.draw do
  get 'patients/new'
  post 'patients/create'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
end
