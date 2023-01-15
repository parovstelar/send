Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :companies, skip: [:passwords], controllers: {
    registrations: "companies/registrations",
    sessions: 'companies/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    sessions: "users/sessions"
  }


  namespace :company do
    resources :companies, only: [:index, :new, :show, :edit, :create, :update]
  end

  root to: 'homes#top'
end
