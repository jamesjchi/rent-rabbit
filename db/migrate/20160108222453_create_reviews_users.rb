class CreateReviewsUsers < ActiveRecord::Migration
  def change
    create_table :reviews_users do |t|
      t.references :review, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
