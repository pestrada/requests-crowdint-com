require 'spec_helper'

#describe 'Emails' do
#  let(:user) { User.create email: 'foo@example.com' }
#  let!(:request) { VotingApp::Submission.create description: 'foo' }
#
#  it 'sends an email after a request is created' do
#    email = ActionMailer::Base.deliveries.last
#    email.should_not be_nil
#    email.subject.should eq 'New request'
#    email.to.should eq User.all.map(&:email)
#  end
#
#  it 'sends an email after a request is promoted' do
#    request.promote
#    email = ActionMailer::Base.deliveries.last
#    email.should_not be_nil
#    email.subject.should eq 'Request promoted'
#    email.to.should eq User.all.map(&:email)
#  end
#
#  it 'sends an email after a request is accepted' do
#    request.update_column :state, 'promoted'
#    request.accept
#    email = ActionMailer::Base.deliveries.last
#    email.should_not be_nil
#    email.subject.should eq 'Request accepted'
#    email.to.should eq User.all.map(&:email)
#  end
#
#  it 'sends an email after a request is rejected' do
#    request.update_column :state, 'promoted'
#    request.reject
#    email = ActionMailer::Base.deliveries.last
#    email.should_not be_nil
#    email.subject.should eq 'Request rejected'
#    email.to.should eq User.all.map(&:email)
#  end
#
#  it 'sends an email after a request is completed' do
#    request.update_column :state, 'accepted'
#    request.complete
#    email = ActionMailer::Base.deliveries.last
#    email.should_not be_nil
#    email.subject.should eq 'Request completed'
#    email.to.should eq User.all.map(&:email)
#  end
#end
