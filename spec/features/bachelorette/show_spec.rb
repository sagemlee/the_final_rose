require 'rails_helper'

RSpec.describe "Bachelorette Show Page" do
  before(:each) do
    @hannah = Bachelorette.create(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet")
    @rachel = Bachelorette.create(name: "Rachel Lindsay", season_number: 13, description: "The one with Rachel")

    @bob = Contestant.create(name: "Bob", age: 26, hometown: "Pasadena", bachelorette_id: @hannah.id)
    @drew = Contestant.create(name: "Drew", age: 27, hometown: "Cleveland", bachelorette_id: @hannah.id)
    @keith = Contestant.create(name: "Keith", age: 31, hometown: "Atlanta", bachelorette_id: @rachel.id)
  end
  it "displays bachelorette's name, season number, description,
      and link to bachelorette's contestant index " do

    visit "/bachelorettes/#{@hannah.id}"
    expect(page).to have_content("Hannah Brown")
    expect(page).to have_content(15)
    expect(page).to have_content("The Most Dramatic Season Yet")
    click_link "Contestants"

    expect(current_path).to eq("/bachelorettes/#{@hannah.id}/contestants")
    expect(page).to have_content(@bob.name)
    expect(page).to have_content(@drew.name)
    expect(page).to_not have_content(@keith.name)
  end
end
