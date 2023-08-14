class AddProducts < ActiveRecord::Migration[7.0]
  def change

    create_table :products do |t|
      t.string :name, null: false
      t.string :slug, index: true, unique: true, null: false
      t.text :description
      t.string :image_url
      t.decimal :price_usd, precision: 8, scale: 2, null: false, index: true
      t.boolean :is_active, default: true
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name, null: false
      t.string :slug, index: true, unique: true, null: false
    end

    create_table :product_categories do |t|
      t.references :product
      t.references :category
    end
    add_index :product_categories, [:product_id, :category_id], unique: true
    add_foreign_key :product_categories, :products,
                    on_delete: :cascade
    add_foreign_key :product_categories, :categories,
                    on_delete: :cascade

  end
end
