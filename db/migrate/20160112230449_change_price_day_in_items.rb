class ChangePriceDayInItems < ActiveRecord::Migration
  def change
    change_column :items, :price_day, :integer
  end
end
