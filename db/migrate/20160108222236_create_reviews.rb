class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :review
      t.date :date_created

      t.timestamps null: false
    end
  end
end
