class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :dob, :date
    add_column :users, :bio, :text
    add_column :users, :interests, :text
  end
end
