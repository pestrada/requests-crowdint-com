Then /^I should receive a new request notification$/ do
  sleep 5
  ActionMailer::Base.deliveries.first.should_not be_nil
  ActionMailer::Base.deliveries.first.subject.should eq 'New request'
end
