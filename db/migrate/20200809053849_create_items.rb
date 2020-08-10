class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string             :item
      t.string             :image
      t.text               :text
      t.integer            :category_id
      t.integer            :status_id
      t.integer            :delivery_burden_id
      t.integer            :shipping_origin_id
      t.integer            :arrival_day_id
      t.integer            :price
      t.references         :user
      t.timestamps
    end
  end
end
