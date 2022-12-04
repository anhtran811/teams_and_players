require 'rails_helper'

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

RSpec.describe 'Edit Player' do
  describe 'As a visitor' do
    describe 'When I visit a Player show page' do
      it "I see a link called 'Update Player' to update that player" do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player_1 = team.players.create!(name: 'Koke', age: 30, old_enough: true)

        visit "/players/#{player_1.id}"
        click_link ("Update: #{player_1.name}")

        expect(current_path).to eq("/players/#{player_1.id}/edit")
      end
    end
  end
end