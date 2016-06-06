require 'rails_helper'

RSpec.feature "UserPromtedToLogin", type: :feature do
  scenario "As an unauthenticated user, when I visit the root of the application, I should be redirected to a page which prompts me to Log In or Sign Up." do

    visit "/"

    expect(page).to have_content "Sign In"
    expect(page).to have_content "Sign Up"
  end

  scenario "As an unauthenticated user, I click Sign Up, and create an account" do

    visit new_user_path

    expect(current_path).to eq "/users/new"

    fill_in "email", with: "adamhundley@gmail.com"
    fill_in "password", with: "password"
    fill_in "user_password_confirmation", with: "password"

    click_on "signup"

    expect(page).to have_content "Hey adamhundley@gmail.com, welcome to THOUGHTBOX"
  end

  scenario "An error occurs if an email is already used" do
    User.create(email: "adamhundley@gmail.com", password: "password")

    visit new_user_path

    fill_in "email", with: "adamhundley@gmail.com"
    fill_in "password", with: "password"
    fill_in "user_password_confirmation", with: "password"

    click_on "signup"

    expect(page).to have_content "Whoops! Email has already been taken"
  end

  scenario "Passwords must match" do
    visit new_user_path

    fill_in "email", with: "adamhundley@gmail.com"
    fill_in "password", with: "password"
    fill_in "user_password_confirmation", with: "passwordd"

    click_on "signup"

    expect(page).to have_content "Whoops! Password confirmation doesn't match Password, Password confirmation doesn't match"
  end
end
