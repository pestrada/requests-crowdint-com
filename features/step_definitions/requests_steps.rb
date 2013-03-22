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
    should have_content request
  end
end

Then /^I should see the request "(.*?)" in the promoted list$/ do |request|
  within '.promoted-list' do
    should have_content request
  end
end

Given /^a request "(.*?)" exists$/ do |description|
  Request.create description: description, user_id: User.create.id, category: 'office'
end

Given /^a promoted request "(.*?)" exists$/ do |description|
  s = Request.create description: description, user_id: User.create.id, category: 'office'
  s.promote
end

Given /^an accepted "(.*?)" request exists$/ do |description|
  s = Request.create description: description, user_id: User.create.id, category: 'office'
  s.promote
  s.accept
end

When /^I up vote the request "(.*?)"$/ do |request|
  find(:xpath, "//li[contains(., '#{request}')]/div[@class='vote-controls']/a[@class='can-vote like']").click
end

When /^I try to up vote the request "(.*?)"$/ do |request|
  find(:xpath, "//li[contains(., '#{request}')]/div[@class='vote-controls']/a[@class='cant-vote like']").click
end

Then /^The "(.*?)" vote count should be (\d+)$/ do |request, expected_count|
  request = Request.find_by_description request
  within ".submission-list .submissions-l li.submission-#{request.id} .votes span:first" do
    should have_content expected_count
  end
end

Given /^a request "(.*?)" owned by me exists$/ do |description|
  Request.create description: description, user_id: User.first.id, category: 'office'
end

Given /^I am logged in as admin$/ do
  visit google_apps_sign_in_path
  User.first.update_column :email, 'admin@example.com'
  User.first.update_column :admin, true
end

When /^I accept the "(.*?)" request$/ do |request|
  find(:xpath, "//li[contains(., '#{request}')]/div[@class='actions']/a[@class='accept']").click
end

When /^I reject the "(.*?)" request$/ do |request|
  find(:xpath, "//li[contains(., '#{request}')]/div[@class='actions']/a[@class='reject']").click
end

When /^I complete the "(.*?)" request$/ do |request|
  find(:xpath, "//li[contains(., '#{request}')]/div[@class='actions']/a[@class='complete']").click
end

Then /^I should see the "(.*?)" request accepted$/ do |request|
  expect do
    find(:xpath, "//li[contains(., '#{request}')]/div[@class='actions']/div[@class='accepted']")
  end.to_not raise_error Capybara::ElementNotFound
end

Then /^I should see the "(.*?)" request rejected/ do |request|
  expect do
    find(:xpath, "//li[contains(., '#{request}')]/div[@class='actions']/div[@class='rejected']")
  end.to_not raise_error Capybara::ElementNotFound
end

Then /^I should see the "(.*?)" request completed/ do |request|
  expect do
    find(:xpath, "//li[contains(., '#{request}')]/div[@class='actions']/div[@class='done']")
  end.to_not raise_error Capybara::ElementNotFound
end

When(/^I select a category$/) do
  page.execute_script("$('#demo-htmlselect').data('ddslick').selectedData.value = 'office'")
end