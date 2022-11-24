class AddCoordinatesToVehicles < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :latitude, :float
    add_column :vehicles, :longitude, :float
  end
end
