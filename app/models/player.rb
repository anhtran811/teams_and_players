class Player < ApplicationRecord
  belongs_to :team

  def self.only_true 
    all.where(old_enough: :true)
  end
end