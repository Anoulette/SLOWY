class ChangeColumnNameOfType < ActiveRecord::Migration[7.0]
  def change
    rename_column :vehicles, :type, :vehicle_type
  end
end
