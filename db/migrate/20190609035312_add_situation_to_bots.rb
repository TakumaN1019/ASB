class AddSituationToBots < ActiveRecord::Migration[5.2]
  def change
    add_column :bots, :situation, :string
  end
end
