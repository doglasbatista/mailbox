Rails.application.routes.draw do
  resources :messages do
    member do
      put :archive
      patch :archive
    end
  end

end
