class Setdefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :toeic_status, from: nil, to: 0
    change_column_default :users, :novel_status, from: nil, to: 0
    change_column_default :users, :paper_status, from: nil, to: 0
  end
end
