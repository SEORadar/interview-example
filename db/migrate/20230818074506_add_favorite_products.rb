class AddFavoriteProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_products do |t|
      t.references :product, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
