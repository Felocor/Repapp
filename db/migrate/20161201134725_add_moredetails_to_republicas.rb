class AddMoredetailsToRepublicas < ActiveRecord::Migration[5.0]
  def change
    add_column :republicas, :zip_code, :string
    add_column :republicas, :country, :string
  end
end
