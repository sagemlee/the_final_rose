class ChangeDateToBeStringInOutings < ActiveRecord::Migration[5.2]
  def change
    change_column :outings, :date, :string
  end
end
