require 'rails_helper'

RSpec.describe 'User', type: :feature do
    before :each do
      @file = fixture_file_upload('clock1.png', 'image/png')
      @userd = User.new(:name => "molly", :avatar => @file)
      @userd.save
    end

    scenario 'shows the right content' do
      visit users_path
      sleep(5)
      expect(page).to have_content('Times')
    end

    scenario 'logs in to a user' do
      visit signin_path
      sleep(2)
      fill_in 'name', :with => "molly"
      click_button "Log in"
      sleep(5)
      expect(page).to have_content('Sign out')
    end
  end