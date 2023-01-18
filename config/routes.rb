Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :companies,  controllers: {
    registrations: "companies/registrations",
    sessions: 'companies/sessions'
  }
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :users,  controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }


  namespace :companies do
    get '/answers/questions/' => 'answers#index_q'
    get '/answers/questions/:id' => 'answers#show_q', as: 'answer_question'
    get '/answers/' => 'answers#index_qa'
    get '/answers/:id' => 'answers#show_qa', as: 'answer'
    resources :answers, only: [:edit, :update]
  end

  scope module: :companies do
    resources :companies, only: [:new, :create, :show, :edit, :update]
  end

  namespace :users do
    get '/answers/' => 'answers#index_qa'
    get '/answers/:id' => 'answers#show_qa', as: 'answer'
  end

  scope module: :users do
    resources :questions, only: [:new, :create, :index, :show]
  end

  root to: 'homes#top'
  get '/about' => 'homes#about'
end
