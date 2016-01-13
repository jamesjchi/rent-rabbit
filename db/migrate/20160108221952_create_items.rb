class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :image
      t.float :price_day
      t.float :price_week
      t.string :start_date
      t.string :end_date
      t.boolean :rented
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
