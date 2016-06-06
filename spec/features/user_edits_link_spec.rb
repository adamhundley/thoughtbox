require 'rails_helper'

Selenium::WebDriver.for :chrome

RSpec.feature "UserEditsLink", type: :feature, js: true do
  before(:each) do
    @user = User.create(email: "adamhundley@gmail.com", password: "password")
    @user.links << (Link.create(title: "Turing", url: "http://www.turing.io"))
    @link = Link.find_by(title: "Turing")
  end

  scenario "User visits the home page, edits link_to" do
    visit login_path
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_on "login"

    within("tr#link-#{@link.id}") do
      find("input.title").click
      fill_in "link[title]", with: "New Title"
      #below simply clicks to insure body is saved
      find("input.url").click
    end
  end
end
