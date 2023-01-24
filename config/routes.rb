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

  scope "companies",module: :companies do
    resources :companies, only: [:new, :create, :show, :edit, :update]
  end

  namespace :companies do
    get '/answers/questions/' => 'answers#question_index'
    get '/answers/questions/:id' => 'answers#show_q', as: 'answer_question'
    get '/answers/' => 'answers#index_qa'
    get '/answers/:id' => 'answers#show_qa', as: 'answer'
    resources :answers, only: [:edit, :update]
  end

  namespace :users do
    get '/answers/' => 'answers#index_qa'
    get '/answers/:id' => 'answers#show_qa', as: 'answer'
  end

  scope "users",module: :users do
    resources :questions, only: [:index, :show]
    get '/questions/new/:company_id' => 'questions#new', as: 'new_question'
    post '/questions/:company_id' => 'questions#create', as: 'create_questions'
  end

  root to: 'homes#top'
  get '/about' => 'homes#about'
end
