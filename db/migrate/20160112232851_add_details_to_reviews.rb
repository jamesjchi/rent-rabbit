class AddDetailsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :reviewer_id, :integer
  end
end
