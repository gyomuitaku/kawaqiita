class CreateTmps < ActiveRecord::Migration[5.2]
  def change
    create_table :tmps do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
