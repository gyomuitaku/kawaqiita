class WordSets < ActiveRecord::Migration[5.2]
  def change
    drop_table :word_sets
  end
end
