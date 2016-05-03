Rails.application.routes.draw do
  root 'messages#index'
  resources :messages do
    collection do
      put :archive_all
    end
    member do
      put :archive
      patch :archive
    end
  end

end
