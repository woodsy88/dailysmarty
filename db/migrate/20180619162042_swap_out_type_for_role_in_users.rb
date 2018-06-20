class SwapOutTypeForRoleInUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type, :string
    remove_column :users, :role, :string    
  end
end
