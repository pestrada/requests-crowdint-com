collection @requests

attributes :id, :description, :state, :created_at, :accepted_at, :category, :email

node(:votes) { |s| s.cached_votes_total }

child(:comments) { attributes :comment, :user_id }

node(:can_vote) { |r| RequestPresenter.new(r).can_vote?(current_user) }
