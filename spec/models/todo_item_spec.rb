require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_uniqueness_of :title }
end

RSpec.describe TodoItem, '#high' do
  it 'returns the high priority todo items' do
    high_priority_todo = create(:todo_item, priority: 'high')
    not_hight_priority_todo = create(:todo_item, priority: 'not_high')

    expect(TodoItem.high).to match_array [high_priority_todo]
  end
end

RSpec.describe TodoItem, '#normal' do
  it 'returns the normal priority todo items' do
    normal_priority_todo = create(:todo_item, priority: 'normal')
    not_normal_priority_todo = create(:todo_item, priority: 'not_normal')

    expect(TodoItem.normal).to match_array [normal_priority_todo]
  end
end

RSpec.describe TodoItem, '#low' do
  it 'returns the low priority todo items' do
    low_priority_todo = create(:todo_item, priority: 'low')
    not_low_priority_todo = create(:todo_item, priority: 'not_low')

    expect(TodoItem.low).to match_array [low_priority_todo]
  end
end
