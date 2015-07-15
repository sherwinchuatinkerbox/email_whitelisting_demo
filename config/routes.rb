EmailWhitelistingDemo::Application.routes.draw do
  resources :blogs do
    post :send_to_emails
  end

  root to: 'blogs#index'
end
