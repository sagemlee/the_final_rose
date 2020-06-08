require 'rails_helper'

Rspec.describe "Bachelorette Show Page" do
  it "displays bachelorette's name, season number, description,
      and link to bachelorette's contestant index " do

    hannah = Bachelorette.create(name: "Hannah Brown", season_number: 15)

    visit '/bachelorettes/:id'
    expect(page).to have_content("Hannah Brown")
  end
end
