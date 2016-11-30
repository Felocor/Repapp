class AddCoordinatesToRepublicas < ActiveRecord::Migration[5.0]
  def change
    add_column :republicas, :latitude, :float
    add_column :republicas, :longitude, :float
  end
end
