Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    resources :attendances, only: [:index, :create] do
      member do
        patch :update_rest_start
        patch :update_rest_end
        patch :update_work_end
      end
    end
  end
end
