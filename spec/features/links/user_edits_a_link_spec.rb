require 'rails_helper'

describe 'A user visits the links index' do

  it "and clicks edit on a link" do
    user = create(:user)
    link1 = create(:link, user: user, title: "One")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_link "Edit"

    expect(current_path).to eq(edit_link_path(link1))

  end

  it "and edits a link" do
    user = create(:user)
    link1 = create(:link, user: user, title: "One", url: "http://www.tuing.io")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_link_path(link1)

    fill_in "Title", with: "Two"

    click_on "Submit Link"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Two")
    expect(page).to_not have_content("One")
  end
end
