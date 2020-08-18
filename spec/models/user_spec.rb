require 'rails_helper'
RSpec.describe User, :type => :model do

  before :each do
    @file = fixture_file_upload('clock1.png', 'image/png')
  end

  it "is valid with valid attributes" do
    expect(User.new(:name => "molly", :avatar => @file)).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil, :avatar => @file)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an avatar" do
    user = User.new(name: "molly", :avatar => nil)
    user.valid?
    expect(user.errors[:avatar]).to include("can't be blank")
  end

end