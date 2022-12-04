require 'rails_helper'

RSpec.describe Player, type: :model do
  it {should belong_to :team}

  describe '#only_true' do
    it 'will only show players that are old enough' do
      spain = Team.create!(name: 'Spain', rank: 7, qualified: true)
      koke = spain.players.create!(name: 'Koke', age: 30, old_enough: true)
      gavi = spain.players.create!(name: 'Gavi', age: 18, old_enough: false)
      torres = spain.players.create!(name: 'Torres', age: 35, old_enough: true)

      expect(Player.only_true).to eq([koke, torres])
      expect(Player.only_true.count).to eq(2)
    end
  end

end
