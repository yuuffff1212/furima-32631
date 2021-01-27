class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.integer :price, null: false
      t.integer :shipping_date_id, null: false
      t.integer :shipping_cost_id, null: false
      t.integer :shipping_region_id, null: false
      t.integer :item_category_id, null: false
      t.integer :item_state_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
