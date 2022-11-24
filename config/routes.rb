Rails.application.routes.draw do
  
  
  
  namespace :admin do
    get 'orders/show'
  end
  
  namespace :admin do
    resources :items,:genres,:customers
  end
  
  scope module: :public do
    root to:'homes#top'
    get '/about' => "homes#about"
    resources :costomers,:items,:orders,:address
    get 'costomers', to: 'costomers#show'
    get '/orders/thanks', to: 'orders#thanks'
    get '/customers/:id/check' =>'costomers#check',as: 'check'
    patch 'customer/:id/withdrawal'=> 'costomers#withdrawal',as: 'withdrawal'
    post '/orders/confirm' => 'orders#confirm'

    resources :cart_items do
      collection do
        delete 'destroy_all'
      end 
    end 
  
  end
  
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  

end
