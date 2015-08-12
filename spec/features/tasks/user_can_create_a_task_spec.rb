require 'rails_helper'

RSpec.describe "Task create" do

  it "can create a Task" do
    visit root_path
    click_link_or_button "Create New List"
    fill_in 'Title', with: "write code"
    fill_in 'Description', with: "better, faster, stronger"
    click_link_or_button "Submit"

    expect(page).to have_content("write code")

    click_link_or_button "write code"
    click_link_or_button "Add Task"

    expect(page).to have_content "Create a New Task"
    fill_in "Title", with: "practice Rails"
    fill_in "Notes", with: "reps reps reps"
    fill_in "Start date", with: Date.new(2015, 8, 17)
    fill_in "Due date", with: Date.new(2015, 8, 21)
    click_link_or_button "Submit"

    expect(current_path).not_to eq lists_path

    expect(page).to have_content("practice Rails")
    expect(page).to have_content("reps reps reps")
    expect(page).to have_content("2015-08-17")
    expect(page).to have_content("2015-08-21")


  end

end
