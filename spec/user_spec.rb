require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit user_index_path
      expect(page).to have_content('Times')
    end
  end
end