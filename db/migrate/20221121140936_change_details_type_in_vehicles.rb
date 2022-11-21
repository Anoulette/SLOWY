class ChangeDetailsTypeInVehicles < ActiveRecord::Migration[7.0]
  def change
    change_table :vehicles do |t|
      t.change :details, :text
    end
  end
end
