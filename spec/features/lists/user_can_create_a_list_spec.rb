require 'rails_helper'

RSpec.describe "create new list" do

  it "can create a list" do
    visit root_path
    click_link_or_button "Create New List"
    fill_in 'Title', with: "write code"
    fill_in 'Description', with: "better, faster, stronger"
    click_link_or_button "Submit"

    expect(current_path).to eq lists_path
    expect(page).to have_content("write code")
  end

end
