require "rails_helper"

describe "A user visits the login path" do
  it "and they successfully log in" do
    user = create(:user)

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_on "Sign In"

    expect(current_path).to eq(root_path)
    expect(page).to have_content "Welcome #{user.name}"
  end
end
