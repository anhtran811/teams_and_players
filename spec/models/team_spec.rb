require 'rails_helper'

RSpec.describe Team, type: :model do
  it {should have_many :players}

  describe 'As a visitor' do
    describe '#ordered teams in index' do
      it 'can order the teams by most recently created' do
        team_1 = Team.create!(name: 'Spain', rank: 7, qualified: true, created_at: DateTime.now - 5.days)
        team_2 = Team.create!(name: 'Canada', rank: 40, qualified: true, created_at: DateTime.now)
        team_3 = Team.create!(name: 'England', rank: 5, qualified: true, created_at: DateTime.now - 3.days)

        expect(Team.ordered).to eq([team_2, team_3, team_1])
      end
    end

    describe '#player_count' do
      it 'can count the number of players associated with the parent' do
        team_1 = Team.create!(name: 'Spain', rank: 7, qualified: true)
        koke = team_1.players.create!(name: 'Koke', age: 30, old_enough: true)
        gavi = team_1.players.create!(name: 'Gavi', age: 18, old_enough: false)
        torres = team_1.players.create!(name: 'Torres', age: 25, old_enough: true)
        
        team_2 = Team.create!(name: 'England', rank: 5, qualified: true)
        kane = team_2.players.create!(name: 'Kane', age: 29, old_enough: true)
        foden = team_2.players.create!(name: 'Foden', age: 21, old_enough: false)
        
        expect(team_1.player_count).to eq(3)
        expect(team_2.player_count).to eq(2)
      end
    end
    
    describe "#alphabetical" do
      it 'can list the player names alphabetically' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        koke = team.players.create!(name: 'Koke', age: 30, old_enough: true)
        torres = team.players.create!(name: 'Torres', age: 25, old_enough: true)
        gavi = team.players.create!(name: 'Gavi', age: 18, old_enough: false)

        expect(team.alphabetical).to eq([gavi, koke, torres])
      end
    end

    describe "#min age threshold" do
      it 'can sort players by minimum age' do
        team = Team.create!(name: 'Spain', rank: 7, qualified: true)
        koke = team.players.create!(name: 'Koke', age: 30, old_enough: true)
        torres = team.players.create!(name: 'Torres', age: 25, old_enough: true)
        gavi = team.players.create!(name: 'Gavi', age: 18, old_enough: false)

        expect(team.max_age(21)).to eq([gavi])
      end
    end
  end
end 