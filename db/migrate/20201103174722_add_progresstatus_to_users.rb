class AddProgresstatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :progress_status, :integer
  end
end
