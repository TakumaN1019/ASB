Rails.application.routes.draw do

  devise_for :users, :controllers => {
    omniauth_callbacks: 'users/omniauth_callbacks', #コールバック
    registrations: 'users/registrations', #登録
    sessions: 'users/sessions' #セッション
  }

  devise_scope :user do
    get 'login' => 'users/sessions#new', as: :login_get # ログインページ
    post 'login/:nickname' => 'users/sessions#create', as: :login_post # ログイン
    delete 'logout/:nickname' => 'users/sessions#destroy', as: :logout # ログアウト
    root to: "users/registrations#new" # トップページ
    post 'signup/:nickname' => 'users/registrations#create', as: :signup_post # 新規登録
    delete 'users/:nickname/destroy' => 'users/registrations#destroy', as: :destroy_user # ユーザー削除
  end

  #get "bots", to: "bots#index", as: :bots # ボット一覧
  #resources :bots, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :bots

  get "/:nickname", to: "users#show", param: :nickname, as: :user # プロフィール画面

end
