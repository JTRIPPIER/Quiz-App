Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'quizzes#index'
  resources :quizzes, only: [:index, :show]

  namespace :admin do
    resources :quizzes, only: [:index, :show, :edit, :update, :new, :create] do
      resources :questions, only: [:new, :create] do
        resources :answers, only: [:new, :create]
      end
    end
  end
end
