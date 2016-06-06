require 'rails_helper'

Selenium::WebDriver.for :chrome

RSpec.feature "UserUpvotesAnIdea", type: :feature, js: true do
  before(:each) do
    @user = User.create(email: "adamhundley@gmail.com", password: "password")
    @user.links << (Link.create(title: "Turing", url: "http://www.turing.io"))
    @user.links << (Link.create(title: "Google", url: "http://www.google.com"))
  end

  scenario "User visits the home page, searches for turing and it appears but google does not" do
    visit login_path
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_on "login"

    within('form.searchLinkForm') do
      fill_in "search", with: "Tur"
    end

    within(".links-table") do
      expect(find_field('link[title]').value).to have_content "Turing"
      expect(find_field('link[url]').value).to have_content "http://www.turing.io"
      expect(page).to_not have_content "Google"
      expect(page).to_not have_content "http://www.google.com"
    end
  end
end
