require 'rails_helper'
RSpec.describe Hour, :type => :model do

  before :each do
    @file = fixture_file_upload('clock1.png', 'image/png')
    @userd = User.create(:name => "molly", :avatar => @file)
  end

  it "is valid with valid attributes" do
    expect(Hour.new(:name => "molly", :amount => 3, :user_id => @userd.id)).to be_valid
  end

  it "is invalid without a name" do
    hour = Hour.new(:name => nil, :amount => 3, :user_id => @userd.id)
    hour.valid?
    expect(hour.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a amount" do
    hour = Hour.new(:name => "molly", :amount => nil, :user_id => @userd.id)
    hour.valid?
    expect(hour.errors[:amount]).to include("can't be blank")
  end

end