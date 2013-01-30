class HomeController < ApplicationController
  def show
    @submitted = VotingApp::Submission.submitted
    @accepted  = VotingApp::Submission.accepted
  end
end
