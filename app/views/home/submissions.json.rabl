collection @submissions

attributes :id, :description, :state, :created_at, :accepted_at

node(:votes) { |s| s.cached_votes_total }
