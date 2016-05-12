require 'rails_helper'

RSpec.describe Task, "validations" do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_uniqueness_of :title }

  it "has a valid factory" do
    expect(build(:task)).to be_valid
  end
end

RSpec.describe Task, '.high' do
  it 'returns the high priority tasks' do
    high_priority_todo = create(:task, priority: 'high')
    not_hight_priority_todo = create(:task, priority: 'not_high')

    expect(Task.high).to match_array [high_priority_todo]
  end
end

RSpec.describe Task, '.normal' do
  it 'returns the normal priority tasks' do
    normal_priority_todo = create(:task, priority: 'normal')
    not_normal_priority_todo = create(:task, priority: 'not_normal')

    expect(Task.normal).to match_array [normal_priority_todo]
  end
end

RSpec.describe Task, '.low' do
  it 'returns the low priority tasks' do
    low_priority_todo = create(:task, priority: 'low')
    not_low_priority_todo = create(:task, priority: 'not_low')

    expect(Task.low).to match_array [low_priority_todo]
  end
end

RSpec.describe Task, '.from_today' do
  it 'returns the tasks not completed and those completed today' do
    not_completed_task = create(:task, completed_at: nil, done: false)
    today_completed_task = create(:task, completed_at: Time.zone.now, done: true)
    old_completed_task = create(:task, completed_at: 1.days.ago, done: true)

    expect(Task.from_today).to match_array [not_completed_task, today_completed_task]
  end
end
