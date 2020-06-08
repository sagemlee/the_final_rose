class Bachelorette < ApplicationRecord
  has_many :contestants

  def contestants
    Contestant.where(bachelorette_id: self.id)
  end
end
