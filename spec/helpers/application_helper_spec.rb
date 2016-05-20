require 'rails_helper'

RSpec.describe ApplicationHelper, "#full_title" do
  context "when the page title is specified" do
    it "concats the page title with the base title" do
      page_title = "Some page title"

      expect(helper.full_title(page_title)).to eq "Some page title | Something TO-DO"
    end
  end
  context "when theres is no page title specified" do
    it "returns the base title" do
      expect(helper.full_title).to eq "Something TO-DO"
    end
  end
end

RSpec.describe ApplicationHelper, "#todo_li_class" do
  context "when the task is done" do
    it "returns 'done'" do
      task = build(:task, done: true)

      expect(helper.todo_li_class(task)).to eq 'done'
    end
  end

  context "when the task is not done" do
    it "return nothing" do
      task = build(:task, done: false)

      expect(helper.todo_li_class(task)).to eq nil
    end
  end
end
