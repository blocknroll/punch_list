require "rails_helper"

RSpec.describe Task, :type => :model do

  it "has a title" do
    task1 = Task.create!(title: "Task 1", notes: "first task note", status: "incomplete", start_date: "2015, 08, 11", due_date: "2015, 08, 12")
    task2 = Task.create(title: "", notes: "second task note", status: "incomplete", start_date: "2015, 08, 11", due_date: "2015, 08, 12")

    expect(task1).to be_valid
    expect(task2).not_to be_valid
  end


  it "is incomplete by default" do
    task1 = Task.create!(title: "Task 1", notes: "first task note", start_date: "2015, 08, 11", due_date: "2015, 08, 12")

    expect(task1.status).to eq('incomplete')
  end


  it "cannot have a start date before the current date" do
    task1 = Task.create(title: "Task 1", notes: "first task note", status: "incomplete", start_date: Date.new(2015, 8, 11))
    task2 = Task.create(title: "Task 2", notes: "second task note", status: "incomplete", start_date: Date.new(1999, 12, 31))

    expect(task1).to be_valid
    expect(task2).not_to be_valid
  end


  it "cannot have a due date before the current date" do
    task1 = Task.create(title: "Task 1", notes: "first task note", status: "incomplete", due_date: Date.new(2015, 8, 21))
    task2 = Task.create(title: "Task 2", notes: "second task note", status: "incomplete", due_date: Date.new(1999, 12, 31))

    expect(task1).to be_valid
    expect(task2).not_to be_valid
  end

end
