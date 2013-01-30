RequestsCrowdintCom::Application.routes.draw do
  mount VotingApp::Engine => '/api'

  root to: 'home#show'
end
