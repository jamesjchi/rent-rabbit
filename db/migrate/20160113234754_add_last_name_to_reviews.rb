class AddLastNameToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :last_name, :string
  end
end
