require 'rails_helper'

RSpec.describe Team, type: :model do
  it {should have_many :players}

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
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

        expect(team_1.player_count).to eq(3)
      end
    end
  end
end 