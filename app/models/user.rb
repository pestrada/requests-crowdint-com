class User < VotingApp::User
  devise :token_authenticatable, :omniauthable

  has_many :submissions

  attr_accessible :email, :provider, :uid, :authentication_token

end

