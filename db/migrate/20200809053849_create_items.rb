class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string             :item               , null: false
      t.text               :text               , null: false
      t.integer            :category_id        , null: false
      t.integer            :status_id          , null: false
      t.integer            :delivery_burden_id , null: false
      t.integer            :shipping_origin_id , null: false
      t.integer            :arrival_day_id     , null: false
      t.integer            :price              , null: false
      t.references         :user
      t.timestamps
    end
  end
end
