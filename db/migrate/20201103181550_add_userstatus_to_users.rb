class AddUserstatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :toeic_status, :integer
    add_column :users, :novel_status, :integer
    add_column :users, :paper_status, :integer
  end
end
