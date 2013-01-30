RequestsCrowdintCom::Application.routes.draw do

  devise_scope :user do
    match 'google_apps_sign_in', :to => "crowdint_auth/omniauth_callbacks#google_apps_sign_in"
  end

  devise_for :users, controllers: { omniauth_callbacks: 'crowdint_auth/omniauth_callbacks' }

  mount VotingApp::Engine => '/api'

  root to: 'home#show'
end
