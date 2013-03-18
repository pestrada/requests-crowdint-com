class Request < VotingApp::Request
  acts_as_votable

  belongs_to :user

  def as_json *args
    super methods: [:cached_votes_total]
  end
end
