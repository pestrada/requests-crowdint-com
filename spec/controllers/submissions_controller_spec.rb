require 'spec_helper'

describe VotingApp::SubmissionsController do
  render_views

  before do
    @routes = VotingApp::Engine.routes
  end

  describe 'POST :create' do
    let(:user) { User.create }

    before do
      controller.stub current_user: user
      post :create, submission: { description: 'foo bar' }, format: :json
    end

    it 'creates a submission' do

      expected_response = %(
        {
          "id": 1,
          "description": "foo bar",
          "created_at": "",
          "accepted_at": null,
          "votes": 0
        }
      )

      expect(response.body).to be_json_eql expected_response
      expect(response.status).to be 201
    end

    it 'should belong to the current user' do
      expect(Submission.last.user_id).to be user.id
    end
  end
end
