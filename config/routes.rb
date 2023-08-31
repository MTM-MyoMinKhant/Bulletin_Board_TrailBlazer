Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  resources 'users' do
    collection do
      get 'confirm' , to: 'users#new_confirm'
      post 'create_confirm' , to: 'users#create_user'
      delete 'soft_delete' , to: 'users#soft_delete'
    end
    member do
      get 'password_change' , to: 'users#password_change'
      post 'password_change' , to: 'users#password_upload'
      post 'delete' , to: 'users#delete'
    end
  end

  resources 'posts' do
    collection do
      get 'csv' , to: 'posts#csv'
      post 'csv', to: 'posts#csv_upload'
      delete 'soft_delete' , to: 'posts#soft_delete'
    end
    member do
      get 'edit/confirm' , to: 'posts#edit_confirm'
      post 'edit/confirm', to: 'posts#edit_data'
    end
  end

end
