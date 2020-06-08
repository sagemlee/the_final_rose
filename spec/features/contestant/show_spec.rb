require 'rails_helper'

RSpec.describe "Contestant Show Page" do
  before(:each) do
    @hannah = Bachelorette.create(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet")
    @rachel = Bachelorette.create(name: "Rachel Lindsay", season_number: 13, description: "The one with Rachel")

    @bob = Contestant.create(name: "Bob", age: 26, hometown: "Pasadena", bachelorette_id: @hannah.id)
    @drew = Contestant.create(name: "Drew", age: 27, hometown: "Cleveland", bachelorette_id: @hannah.id)
    @keith = Contestant.create(name: "Keith", age: 31, hometown: "Atlanta", bachelorette_id: @rachel.id)

    @beach = Outing.create(name:"Beach", location: "Los Angeles", date: "09/12/19")
    @kickball = Outing.create(name:"Kickball", location: "Peru", date: "08/12/19")
    @heli = Outing.create(name:"Helicopter Ride", location: "The Sky", date: "02/12/19")

    ContestantOuting.create!(outing_id: @beach.id, contestant_id: @bob.id)
    ContestantOuting.create!(outing_id: @beach.id, contestant_id: @drew.id)
    ContestantOuting.create!(outing_id: @heli.id, contestant_id: @drew.id)
    visit "/contestants/#{@drew.id}"

  end

  it "displays contestant name, season number, season description, and outings" do
    expect(page).to have_content(@drew.name)
    expect(page).to have_content(@hannah.season_number)
    expect(page).to have_content(@hannah.description)
  end

  it "displays outing name as link to outings show page" do
    click_link "#{@beach.name}"
    expect(current_path).to eq("/outings/#{@beach.id}")
  end
end
