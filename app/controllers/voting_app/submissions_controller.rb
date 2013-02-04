module VotingApp
  class SubmissionsController < ApplicationController
    def create
      params[:submission].merge!({ user_id: current_user.id })
      @submission = ::Submission.create(params[:submission])
      if @submission
        render status: :created
      else
        render status: :unprocessable_entity
      end
    end
  end
end
