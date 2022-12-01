require 'rails_helper'

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
#   (data from each column that is on the parent table)

RSpec.describe 'Team Show' do
  describe 'As a visitor' do
    it 'can visit a specific teams show page /teams/:id, ' do
      team = Team.create!(name: 'Spain', rank: 7, qualified: true)
      visit "/teams/#{team.id}"
      
      expect(current_path).to eq("/teams/#{team.id}")
    end
    
    it 'can display the team with the id including the teams attributes' do
      team= Team.create!(name: 'Spain', rank: 7, qualified: true)
    
      visit "/teams/#{team.id}"

      expect(page).to have_content('Spain')
      expect(page).to have_content(7)
      expect(page).to have_content(true)
    end

  end
end