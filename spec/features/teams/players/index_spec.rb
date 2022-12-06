require 'rails_helper'

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

RSpec.describe 'Teams Players Index' do
  describe 'As a visitor' do
    it 'can visit /teams/:team_id/players' do
      spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
      gavi = spain.players.create!(name: 'Gavi', age: 18, old_enough: false)
    
      visit "/teams/#{spain.id}/players"

      expect(current_path).to eq("/teams/#{spain.id}/players")
    end
    
    it 'can see each Player that is associated with that Team and each Players attributes' do
      spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
      gavi = spain.players.create!(name: 'Gavi', age: 18, old_enough: false)
      torres = spain.players.create!(name: 'Torres', age: 25, old_enough: true)

      visit "/teams/#{spain.id}/players"

      expect(page).to have_content(spain.name)
      expect(page).to have_content(gavi.name)
      expect(page).to have_content(gavi.age)
      expect(page).to have_content(gavi.old_enough)
      expect(page).to have_content(torres.name)
      expect(page).to have_content(torres.age)
      expect(page).to have_content(torres.old_enough)
    end

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index
    it 'I can see a link at the top of the page that takes me to the player index' do
      team = Team.create!(name: 'Spain', rank: 7, qualified: true)
      player_1 = Player.create!(name: 'Koke', age: 30, old_enough: true, team_id: team.id)

      visit "/teams/#{team.id}/players"

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
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order
# When I click on the link
# I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
    it 'can have a link that returns players alphabetically' do
      team = Team.create!(name: 'Spain', rank: 7, qualified: true)
      koke = team.players.create!(name: 'Koke', age: 30, old_enough: true)
      gave = team.players.create!(name: 'Gavi', age: 18, old_enough: false)
      torres = team.players.create!(name: 'Torres', age: 35, old_enough: true)

      visit "/teams/#{team.id}/players"
      click_link ("#{team.name} players listed alphabetically")

      expect(current_path).to eq("/teams/#{team.id}/players")
      expect(page).to have_content('Koke')
      expect(page).to have_content('Gavi')
      expect(page).to have_content('Torres')
      expect(page).to_not have_content('Pique')
    end

# As a visitor
# When I visit a parent `child_table_name` index page
# Next to every child, I see a link to edit that child's info
# When I click the link
# I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14
    it 'can see a link next to every player to edit the player' do
      spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
      koke = spain.players.create!(name: 'Koke', age: 30, old_enough: true)
      torres = spain.players.create!(name: 'Torres', age: 35, old_enough: true)
      
      visit "/teams/#{spain.id}/players"
      click_link("Edit: #{koke.name}")

      expect(current_path).to eq("/players/#{koke.id}/edit")
      
      
      visit "/teams/#{spain.id}/players"
      click_link("Edit: #{torres.name}")

      expect(current_path).to eq("/players/#{torres.id}/edit")
    end

# As a visitor
# When I visit the Parent's children Index Page
# I see a form that allows me to input a number value
# When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
# Then I am brought back to the current index page with only the records that meet that threshold shown.
      it 'can see a form to input a minimum age' do
        spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
        koke = spain.players.create!(name: 'Koke', age: 30, old_enough: true)
        torres = spain.players.create!(name: 'Torres', age: 35, old_enough: true)
        gavi = spain.players.create!(name: 'Gavi', age: 18, old_enough: false)

        visit "/teams/#{spain.id}/players"

        click_on ("Only show #{spain.name} players over 21")

        expect(current_path).to eq("/teams/#{spain.id}/players")
        expect(page).to have_content(koke.name)
        expect(page).to have_content(torres.name)
      end
  end
end
