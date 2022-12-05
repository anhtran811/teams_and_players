require 'rails_helper'

# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent

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
end