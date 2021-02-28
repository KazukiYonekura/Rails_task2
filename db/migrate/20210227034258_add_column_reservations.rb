class AddColumnReservations < ActiveRecord::Migration[6.1]
  def change
  	add_column :reservations, :count, :string
  	add_column :reservations, :room_id, :string
  	add_column :reservations, :user_id, :string
  	add_column :reservations, :post_name, :string
  	add_column :reservations, :post_text, :string
  end
end
