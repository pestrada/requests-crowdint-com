class Submission < VotingApp::Submission
  attr_accessible :user_id

  belongs_to :user

  acts_as_votable

  def as_json *args
    super methods: [:cached_votes_total]
  end

end
