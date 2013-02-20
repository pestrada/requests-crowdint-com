Given /^I am logged in$/ do
  visit google_apps_sign_in_path
  User.first.update_column :email, 'test@example.com'
end

When /^I go to the home page$/ do
  visit root_path
end

When /^I go to promoted page$/ do
  visit root_path + '#promoted'
end

When /^I write the request "(.*?)"$/ do |request|
  fill_in 'new_submission', with: request
end

When /^I submit the request$/ do
  click_link 'SUBMIT'
end

Then /^I should see the request "(.*?)" in the submitted list$/ do |request|
  within '.submission-list .submissions-l' do
    have_content request
  end
end

Then /^I should see the request "(.*?)" in the promoted list$/ do |request|
  within '.promoted-list' do
    have_content request
  end
end

Given /^a request "(.*?)" exists$/ do |description|
  Request.create description: description, user_id: User.create.id
end

Given /^a promoted request "(.*?)" exists$/ do |description|
  s = Request.create description: description, user_id: User.create.id
  s.promote
end

When /^I up vote the request "(.*?)"$/ do |request|
  find(:xpath, "//li[contains(., '#{request}')]/div[@class='vote-controls']/a[@class='like']").click
end

Then /^The "(.*?)" vote count should be (\d+)$/ do |request, expected_count|
  request = Request.find_by_description request
  within ".submission-list .submissions-l li.submission-#{request.id} .votes" do
    have_content expected_count
  end
end

Given /^a request "(.*?)" owned by me exists$/ do |description|
  Request.create description: description, user_id: User.first.id
end
