Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index', as: :root
  resources :questions do
    resources :answers
  end
  resources :quizzes
  resources :leaderboard, only: [:index]

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]
end
