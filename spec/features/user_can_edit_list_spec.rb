require 'rails_helper'

RSpec.describe "edit list" do

  it "can edit a list" do
    visit root_path
    click_link_or_button "Create New List"
    fill_in 'Title', with: "write code"
    fill_in 'Description', with: "better, faster, stronger"
    click_link_or_button "Submit"

    expect(page).to have_content("write code")
    expect(page).to have_content("better, faster, stronger")


    click_link_or_button "write code"
    click_link_or_button "Edit"
    fill_in "Title", with: "go outside"
    fill_in "Description", with: "get some fresh air"
    click_link_or_button "Submit"

    expect(page).to have_content("go outside")
    expect(page).to have_content("get some fresh air")
  end

end
