require 'rails_helper'

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)

RSpec.describe 'Player Index' do
  describe 'As a visitor' do
    describe 'When I visit /players' do
      it 'I can see the players attributes' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)

        visit '/players'

        expect(page).to have_content('Koke')
        expect(page).to have_content(30)
        expect(page).to have_content(true)
      end

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index
      it 'I can see a link at the top of the page that takes me to the player index' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player_1 = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)
      
        visit '/players'

        click_link('Player Index')

        expect(current_path).to eq('/players')
      end

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index
      it 'I can see a link at the top of the page that takes me to the teams index' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        player_1 = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)
      
        visit '/players'

        click_link('Teams Index')

        expect(current_path).to eq('/teams')
      end

# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`
      it 'I will only see the records where the boolean column is true' do
        spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
        koke = spain.players.create!(name: 'Koke', age: 30, old_enough: true)
        gavi = spain.players.create!(name: 'Gavi', age: 18, old_enough: false)
        torres = spain.players.create!(name: 'Torres', age: 35, old_enough: true)

        visit '/players'

        expect(page).to have_content(koke.name)
        expect(page).to have_content(koke.age)
        expect(page).to have_content(koke.old_enough)
        expect(page).to_not have_content(gavi.name)
        expect(page).to_not have_content(gavi.age)
        expect(page).to_not have_content(gavi.old_enough)
        expect(page).to have_content(torres.name)
        expect(page).to have_content(torres.age)
        expect(page).to have_content(torres.old_enough)
      end

    end
  end
end