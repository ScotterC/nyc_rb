NycRb::Application.routes.draw do
  devise_for :users
  resources :users do
    collection do
      get :me, constraints: { format: /(json)/ }
    end
  end

  root to: "pages#home"
end
