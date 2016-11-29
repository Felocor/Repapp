class AddCityToRepublicas < ActiveRecord::Migration[5.0]
  def change
    add_column :republicas, :city, :string
  end
end
