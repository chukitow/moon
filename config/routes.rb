Moon::Engine.routes.draw do
  namespace :admin do
    resources :products, except: [:show]
  end
end
