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
    resources :companies, only: [:show, :edit, :update]
    resources :questions, only: [:index, :show, :update]
    resources :answers, only: [:index, :show]
  end

  scope module: :users do
    resources :companies, only: [:index, :show] do
      resources :questions, only: [:new, :create]
    end
    resources :answers, only: [:index, :show]
  end

  root to: 'homes#top'
  get '/about' => 'homes#about'
end
