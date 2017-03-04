Rails.application.routes.draw do
  resources :hospitals do
    resources :patients do
      resources :families
    end
  end
end
