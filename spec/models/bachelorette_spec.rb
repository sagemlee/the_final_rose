require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe "instance methods" do
    it '.contestants' do
      @hannah = Bachelorette.create(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet")
      @rachel = Bachelorette.create(name: "Rachel Lindsay", season_number: 13, description: "The one with Rachel")

      @bob = Contestant.create(name: "Bob", age: 26, hometown: "Pasadena", bachelorette_id: @hannah.id)
      @drew = Contestant.create(name: "Drew", age: 27, hometown: "Cleveland", bachelorette_id: @hannah.id)
      @keith = Contestant.create(name: "Keith", age: 31, hometown: "Atlanta", bachelorette_id: @rachel.id)

      expect(@hannah.contestants).to eq([@bob, @drew])
      expect(@hannah.contestants).to_not eq([@keith])
      expect(@rachel.contestants).to eq([@keith])
    end
  end
end
