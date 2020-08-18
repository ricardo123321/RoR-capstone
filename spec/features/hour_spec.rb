require 'rails_helper'
RSpec.describe 'Hour', type: :feature do
  before :each do
    @file = fixture_file_upload('clock1.png', 'image/png')
    @userd = User.new(:name => "molly", :avatar => @file)
    @userd.save
    @group = Group.new(:name => "kitchen", :icon => @file)
    @group.save
    visit signin_path
    sleep(2)
    fill_in 'name', :with => "molly"
    click_button "Log in"
  end

  scenario 'create a new hour' do
    visit hours_path
    click_on 'New Hour'
    fill_in 'name', :with => "molly"
    fill_in 'amount', :with => 6
    click_button "Create Hour"
    sleep(2)
    visit external_path
    expect(page).to have_content('molly')
  end

end