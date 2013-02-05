class User < VotingApp::User
  devise :token_authenticatable, :omniauthable

  attr_accessible :email, :provider, :uid, :authentication_token

  has_many :submissions

end

