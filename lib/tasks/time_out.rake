namespace :requests do
  desc "Change state to 'timed_out' on timed out requests"
  task :timeout => :environment do
    VotingApp::Request.submitted.reverse.each do |r|
      if r.created_at + 7.days <= Time.now
        r.time_out
      else
        break
      end
    end
  end
end