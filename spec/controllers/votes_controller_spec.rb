require 'spec_helper'

describe VotingApp::VotesController do
  render_views

  before do
    @routes = VotingApp::Engine.routes
  end

  describe 'POST :create' do
    let(:user) { User.create }
    let(:submission) { Submission.create(description: 'foo') }

    before do
      controller.stub current_user: user
      Submission.should_receive(:find).and_return submission
    end

    it 'should increment submission votes by one' do
      expect do
        post :create, submission_id: 1, format: :json
      end.to change{ submission.count_votes_total }.by(1)
    end

    context "When current user is the submission's owner" do
      before do
        submission.stub user: user
      end

      it 'should not increment submission votes' do
        expect do
          post :create, submission_id: 1, format: :json
        end.to_not change{ submission.count_votes_total }.by(1)
      end
    end
  end
end
