require 'rails_helper'

RSpec.feature "UserPromtedToLogin", type: :feature do
  scenario "Authenticated user signs in and then out" do

    user = User.create(email: "adamhundley@gmail.com", password: "password")

    visit login_path

    expect(current_path).to eq "/login"

    fill_in "email", with: user.email
    fill_in "password", with: user.password

    click_on "login"

    expect(page).to have_content "Hey adamhundley@gmail.com, welcome to THOUGHTBOX"

    click_on "logout"

    expect(page).to have_content "Sad to see you go adamhundley@gmail.com. Come back again soon."
  end
end
