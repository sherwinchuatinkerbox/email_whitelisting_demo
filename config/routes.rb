EmailWhitelistingDemo::Application.routes.draw do
  resources :blogs do
    member do 
      post :send_to_emails
    end
  end

  root to: 'blogs#index'
end
