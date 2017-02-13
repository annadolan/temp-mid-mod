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
  end

  it "And leaves a field blank" do
    visit signup_path

    fill_in "Name", with: "Anna"
    fill_in "Email", with: "anna@anna.com"

    click_on "Sign Up"

    expect(page).to have_content("There was a problem creating your account.")
  end
end
