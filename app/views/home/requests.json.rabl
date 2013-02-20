collection @requests

attributes :id, :description, :state, :created_at, :accepted_at, :mood, :email

node(:votes) { |s| s.cached_votes_total }
