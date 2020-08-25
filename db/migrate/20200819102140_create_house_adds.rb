class CreateHouseAdds < ActiveRecord::Migration[6.0]
  def change
    create_table :house_adds do |t|
      t.string      :postal_code,        null: false              
      t.integer     :shipping_origin_id, null: false              
      t.string      :city,               null: false              
      t.string      :address,            null: false              
      t.string      :building_name                                
      t.string      :phone,              null: false              
      t.references  :purchase,           null: false, foreign_key: true
      t.timestamps 
    end
  end
end
