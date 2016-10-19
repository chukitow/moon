Moon::Engine.routes.draw do
  namespace :admin do
    resources :products, except: [:show] do
      resources :images, except: [:show]
    end
  end
end
