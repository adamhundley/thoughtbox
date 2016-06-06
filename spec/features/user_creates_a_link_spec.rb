require 'rails_helper'

RSpec.feature "UserCreatesLink", type: :feature do
  scenario "As an authenticated user, when I visit the links page I view a form and can create a link" do
    user = User.create(email: "adamhundley@gmail.com", password: "password")

    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on "login"

    expect(current_path).to eq "/links"

    fill_in "url", with: "http://www.turing.io"
    fill_in "title", with: "Turing"

    click_on "submit link"

    expect(page).to have_content "New Link Added"
  end

  scenario "A non valid link is submitted and an error is recieved" do
    user = User.create(email: "adamhundley@gmail.com", password: "password")

    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on "login"

    expect(current_path).to eq "/links"

    fill_in "url", with: "www.turing.io"
    fill_in "title", with: "Turing"

    click_on "submit link"

    expect(page).to have_content "Something is up with that URL. Visit it in your browse and then copy that exact link!"
  end
end
