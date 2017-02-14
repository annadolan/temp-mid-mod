require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  xscenario "Mark a link as read", :vcr do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user.links.create(url:"https://turing.io", title:"Turing")

    visit "/"

    expect(page).to have_text("Read: false")


    click_link "Mark as read"

    visit "/"
    expect(page).to have_text("Read: true")


  end
end
