require 'rails_helper'
RSpec.describe Group, type: :model do
  before :each do
    @file = fixture_file_upload('clock1.png', 'image/png')
    @userd = User.create(name: 'molly', avatar: @file)
    @hourd = Hour.new(name: 'molly', amount: 3, user_id: @userd.id)
  end

  it 'is valid with valid attributes' do
    expect(Group.new(name: 'kitchen', icon: @file)).to be_valid
  end

  it 'is invalid without a name' do
    group = Group.new(name: nil, icon: @file)
    group.valid?
    expect(group.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a icon' do
    group = Group.new(name: 'molly', icon: nil)
    group.valid?
    expect(group.errors[:icon]).to include("can't be blank")
  end
end
