Rails.application.routes.draw do
  resources :hospitals do
    resources :patients
    resources :families
  end
end
