require 'rails_helper'

RSpec.describe "Bachelorette's Contestants Index Page" do
  before(:each) do
    @hannah = Bachelorette.create(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet")
    @rachel = Bachelorette.create(name: "Rachel Lindsay", season_number: 13, description: "The one with Rachel")

    @bob = Contestant.create(name: "Bob", age: 26, hometown: "Pasadena", bachelorette_id: @hannah.id)
    @drew = Contestant.create(name: "Drew", age: 27, hometown: "Cleveland", bachelorette_id: @hannah.id)
    @keith = Contestant.create(name: "Keith", age: 31, hometown: "Atlanta", bachelorette_id: @rachel.id)
    visit "/bachelorettes/#{@hannah.id}/contestants"
  end

  it "displays each contestant including their name and hometown" do
    within "#contestant-#{@bob.id}" do
      expect(page).to have_content(@bob.name)
      expect(page).to have_content(@bob.hometown)
      expect(page).to_not have_content(@drew.name)
    end

    within "#contestant-#{@drew.id}" do
      expect(page).to have_content(@drew.name)
      expect(page).to have_content(@drew.hometown)
      expect(page).to_not have_content(@bob.name)
    end
    expect(page).to_not have_content(@keith.name)
  end

  it "displays each contestants name as link to their show page" do
    click_link "#{@drew.name}"
    expect(current_path).to eq("/contestants/#{@drew.id}")
  end
end
