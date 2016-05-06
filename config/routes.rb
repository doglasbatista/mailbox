Rails.application.routes.draw do
  root 'messages#index'
  resources :messages, except: [:edit, :update] do
    collection do
      put :archive_all
    end
    member do
      put :archive
      patch :archive
    end
  end

end
