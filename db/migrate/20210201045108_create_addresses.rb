class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :postal_code,       null:false
      t.string  :city,              null:false
      t.string  :house_number,      null:false
      t.string :building_number
      t.string :tell,               null: false
      t.references :customer,       foreign_key: true
      t.integer :shipping_region_id, null: false
      t.timestamps
    end
  end
end
