class RemoveProgresstatusToUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :progress_status
  end

  def down
    add_column :users, :progress_status, :integer
  end
end
