require 'rails_helper'

describe "A user visits the signup form" do
  it "and successfully signs up for an account" do
    visit signup_path

    fill_in "Name", with: "Anna"
    fill_in "Email", with: "anna@anna.com"
    fill_in "Password", with: "password"

    click_on "Sign Up"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome Anna!")
    expect(page).to have_link("Log Out", logout_path)
  end

  it "And uses an existing email address" do
    user = create(:user, email: 'anna@anna.com')
    visit signup_path

    fill_in "Name", with: "Anna"
    fill_in "Email", with: "anna@anna.com"
    fill_in "Password", with: "password"

    click_on "Sign Up"

    expect(page).to have_content("There is already an email address associated with this account.")
  end
end
