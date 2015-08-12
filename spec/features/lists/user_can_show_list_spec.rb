require 'rails_helper'

RSpec.describe "show list" do

  it "can show a list" do
    visit root_path
    click_link_or_button "Create New List"
    fill_in 'Title', with: "write code"
    fill_in 'Description', with: "better, faster, stronger"
    click_link_or_button "Submit"

    expect(page).to have_content("write code")
  end

end
