require 'rails_helper'

RSpec.describe List, type: :model do

  it "has a title (required)" do
    list1 = List.create!(title: "List 1", description: "a super amazing list")
    list2 = List.create(title: "", description: "another super amazing list")
    list3 = List.create(description: "yet another super amazing list")

    expect(list1).to be_valid
    expect(list2).not_to be_valid
    expect(list3).not_to be_valid
  end

end
