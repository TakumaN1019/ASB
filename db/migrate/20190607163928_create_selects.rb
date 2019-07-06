class CreateSelects < ActiveRecord::Migration[5.2]
  def change
    create_table :selects do |t|
      t.references :bot, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
