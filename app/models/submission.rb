class Submission < VotingApp::Submission

  acts_as_votable

  def as_json *args
    super methods: [:cached_votes_total]
  end

  def class
    VotingApp::Submission
  end
end
