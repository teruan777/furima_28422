class AddCheckedToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :checked, :boolean
  end
end
