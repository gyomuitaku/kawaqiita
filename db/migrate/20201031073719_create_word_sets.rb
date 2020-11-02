class CreateWordSets < ActiveRecord::Migration[5.2]
  def change
    create_table :word_sets do |t|
      t.string :word_first
      t.string :word_second
      t.string :word_third
      t.string :word_forth

      t.timestamps
    end
  end
end
