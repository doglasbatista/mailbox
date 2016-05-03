Rails.application.routes.draw do
  root 'messages#index'
  resources :messages do
    member do
      put :archive
      patch :archive
    end
  end

end
