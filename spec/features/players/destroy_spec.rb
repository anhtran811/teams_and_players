require 'rails_helper'

# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child

RSpec.describe 'Destroying a player' do
  describe 'As a visitor' do
    describe 'When I visit a player show page' do
      it 'can delete a player' do 
        portugal = Team.create!(name: 'Portugal', rank: 9, qualified: true)
        silva = portugal.players.create!(name: 'Silva', age: 19, old_enough: true)

        visit "/players/#{silva.id}"
        click_button ("Delete: #{silva.name}")

        expect(current_path).to eq('/players')
        expect(page).to_not have_content('Silva')
      end
    end

# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to delete that child
# When I click the link
# I should be taken to the `child_table_name` index page where I no longer see that child
    describe 'When I visit a players index page' do
      it 'can delete a player' do
        portugal = Team.create!(name: 'Portugal', rank: 9, qualified: true)
        silva = portugal.players.create!(name: 'Silva', age: 19, old_enough: true)

        visit '/players'
        click_button("Delete: #{silva.name}")

        expect(current_path).to eq('/players')
        expect(page).to_not have_content('Silva')
      end
    end
    
  end
end