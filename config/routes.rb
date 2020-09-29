Rails.application.routes.draw do
  root to: 'posts#index'
  post 'posts', to: 'posts#create'

  #既読機能のエンドポイント（pathパラメーター）
  get 'posts/:id', to: 'posts#checked'
end