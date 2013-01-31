class User < VotingApp::User
  devise :token_authenticatable, :omniauthable

  attr_accessible :email, :provider, :uid, :authentication_token

  def class
    VotingApp::User
  end
end

