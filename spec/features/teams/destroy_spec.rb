require 'rails_helper'

RSpec.describe 'Destroying a team' do
  describe 'When I visit a team show page' do
    it 'can delete the team' do
      team = Team.create!(name: 'Portugal', rank: 9, qualified: true)

      visit "/teams/#{team.id}"
      click_button "Delete: #{team.name}"
      
      expect(current_path).to eq('/teams')
    
      expect(page).to_not have_content('Portugal')
    end
  end

  describe 'When I visit a team index page' do
    it 'can delete the team' do
      team = Team.create!(name: 'Portugal', rank: 9, qualified: true)

      visit '/teams'
      click_button "Delete: #{team.name}"

      expect(current_path).to eq('/teams')
      expect(page).to_not have_content('Portugal')
    end
  end
end