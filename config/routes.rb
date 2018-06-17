Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index', as: :root
  resources :questions do
    resources :answers
  end
  resources :quizzes
  resources :leaderboard, only: [:index]

  resources :users, only: [:new, :create] do
    resources :results
  end

  resources :sessions, only: [:new, :create, :destroy]


post '/quiz/:id/test', to: 'quizzes#test', as: 'quiz_test'

end
