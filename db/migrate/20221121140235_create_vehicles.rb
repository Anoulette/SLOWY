class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :type
      t.string :details
      t.string :name
      t.string :street
      t.string :city
      t.string :zipcode
      t.integer :price
      t.integer :street_number
      t.boolean :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
