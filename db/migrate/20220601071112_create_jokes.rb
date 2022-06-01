class CreateJokes < ActiveRecord::Migration[6.1]
  def change
    create_table :jokes do |t|
      t.text :story, null: false
      t.integer :minute_mark, null: false, index: true

      t.timestamps
    end
  end
end
