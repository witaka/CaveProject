Rails.application.routes.draw do
  
  namespace :admin do
       resources :dashboard, only: [:index, :update]
  end
  get '/', to: 'welcome#index', as: :root
  resources :questions do
    resources :answers
  end
  resources :quizzes
  resources :leaderboard, only: [:index]

  resources :users, only: [:new, :create, :update] do
    resources :results, only: [:new, :index,:create,:update,:show,:edit]
  end

  resource :session, only: [:new, :create, :destroy]

end
