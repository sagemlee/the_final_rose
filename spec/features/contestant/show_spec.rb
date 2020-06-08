require 'rails_helper'

RSpec.describe "Contestant Show Page" do
  before(:each) do
    @hannah = Bachelorette.create(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet")
    @rachel = Bachelorette.create(name: "Rachel Lindsay", season_number: 13, description: "The one with Rachel")

    @bob = Contestant.create(name: "Bob", age: 26, hometown: "Pasadena", bachelorette_id: @hannah.id)
    @drew = Contestant.create(name: "Drew", age: 27, hometown: "Cleveland", bachelorette_id: @hannah.id)
    @keith = Contestant.create(name: "Keith", age: 31, hometown: "Atlanta", bachelorette_id: @rachel.id)
    visit "/bachelorettes/#{@hannah.id}/contestants/#{@bob.id}"

  end

  xit "displays contestant name, season number, season description, and outings" do
    expect(page).to have_content(@bob.name)
    expect(page).to have_content(@hannah.season_number)
    expect(page).to have_content(@hannah.description)
  end

  xit "displays outing name as link to outings show page" do
    click_link "#{@bob.outings}"
  end
end
