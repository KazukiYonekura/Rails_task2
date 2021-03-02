class AddPasswordToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password, :string
    add_column :users, :rpassword, :string
    add_column :users, :change_password, :string
    add_column :users, :change_rpassword, :string
  end
end
