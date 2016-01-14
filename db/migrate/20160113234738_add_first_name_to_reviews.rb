class AddFirstNameToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :first_name, :string
  end
end
