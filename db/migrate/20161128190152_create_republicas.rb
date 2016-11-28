class CreateRepublicas < ActiveRecord::Migration[5.0]
  def change
    create_table :republicas do |t|
      t.string :name
      t.text :address
      t.text :description
      t.integer :vacancies
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
