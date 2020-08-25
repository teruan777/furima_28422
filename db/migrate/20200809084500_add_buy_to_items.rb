class AddBuyToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :buy, :boolean
  end
end
