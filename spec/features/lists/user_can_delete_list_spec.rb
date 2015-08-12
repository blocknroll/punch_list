require 'rails_helper'

RSpec.describe "delete list" do

  it "can delete a list" do
    visit root_path
    click_link_or_button "Create New List"
    fill_in 'Title', with: "write code"
    fill_in 'Description', with: "better, faster, stronger"
    click_link_or_button "Submit"

    expect(page).to have_content("write code")
    expect(page).to have_content("better, faster, stronger")

    click_link_or_button "write code"
    click_link_or_button "Delete List"
    expect(current_path).to eq root_path
    expect(page).to have_content("Punch Lists")
  end

end
