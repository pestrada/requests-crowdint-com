Given /^I am logged in$/ do
  visit google_apps_sign_in_path
end

When /^I go to the home page$/ do
  visit root_path
end

When /^I go to accepted page$/ do
  visit root_path + '#accepted'
end

When /^I write the request "(.*?)"$/ do |request|
  fill_in 'new_submission', with: request
end

When /^I submit the request$/ do
  click_link 'Submit request'
end

Then /^I should see the request "(.*?)" in the submitted list$/ do |request|
  within '.submission-list .submissions' do
    have_content request
  end
end

Then /^I should see the request "(.*?)" in the accepted list$/ do |request|
  within '.submission-list .accepted' do
    have_content request
  end
end

Given /^a request "(.*?)" exists$/ do |description|
  Submission.create description: description
end

Given /^an accepted request "(.*?)" exists$/ do |description|
  s = Submission.create description: description
  s.accept
end

When /^I up vote the request "(.*?)"$/ do |request|
  request = Submission.find_by_description request
  within ".submission-list .submissions li.submission-#{request.id}" do
    find('.like').click
  end
end

Then /^The "(.*?)" vote count should be (\d+)$/ do |request, expected_count|
  request = Submission.find_by_description request
  within ".submission-list .submissions li.submission-#{request.id} .votes" do
    have_content expected_count
  end
end
