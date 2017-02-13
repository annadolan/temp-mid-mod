require "rails_helper"

describe "A user visits the root path" do
  it "and they see a link to log in and a link to sign up" do
    visit root_path

    expect(page).to have_link("Log In")
    expect(page).to have_link("Sign Up")
  end
end
