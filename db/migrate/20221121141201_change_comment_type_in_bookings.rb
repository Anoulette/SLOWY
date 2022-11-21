class ChangeCommentTypeInBookings < ActiveRecord::Migration[7.0]
  def change
    change_table :bookings do |t|
      t.change :comment, :text
    end
  end
end
