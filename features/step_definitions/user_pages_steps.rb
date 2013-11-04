Given /^a user visits signin page$/ do 
  visit new_user_session_path
end

And   /^user is registered$/ do
  @user = User.create(email: "test@mail.com", password: "foobar123", password_confirmation: "foobar123")
end

When  /^user enters valid information$/ do
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then  /^user should see start page$/ do
  expect(page).to have_title('Home')
end

And   /^should see signout link$/ do
  expect(page).to have_link('Logout', destroy_user_session_path(@user))
end

And   /^should see settings link$/ do
  expect(page).to have_link('Settings', edit_user_registration_path(@user))
end

When   /^user enters invalid information$/ do
  click_button "Sign in"
end

Then   /^user should see signin page$/ do
  expect(page).to have_link('Login', new_user_session_path)
end

And /^should not have profile link$/ do
  expect(page).not_to have_link("Profile", user_path(@user))
end