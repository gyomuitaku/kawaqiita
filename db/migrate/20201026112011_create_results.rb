class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :user_id
      t.string :word, null: false
      t.string :meaning, null: false
      t.boolean :is_correct, null: false, default: true

      t.timestamps
    end
  end
end
