class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :image
      t.string :location
      t.date :date_created
      t.float :avg_rating
      t.text :bio

      t.timestamps null: false
    end
  end
end
