require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_uniqueness_of :title }
end

RSpec.describe Task, '#high' do
  it 'returns the high priority todo items' do
    high_priority_todo = create(:task, priority: 'high')
    not_hight_priority_todo = create(:task, priority: 'not_high')

    expect(Task.high).to match_array [high_priority_todo]
  end
end

RSpec.describe Task, '#normal' do
  it 'returns the normal priority todo items' do
    normal_priority_todo = create(:task, priority: 'normal')
    not_normal_priority_todo = create(:task, priority: 'not_normal')

    expect(Task.normal).to match_array [normal_priority_todo]
  end
end

RSpec.describe Task, '#low' do
  it 'returns the low priority todo items' do
    low_priority_todo = create(:task, priority: 'low')
    not_low_priority_todo = create(:task, priority: 'not_low')

    expect(Task.low).to match_array [low_priority_todo]
  end
end
