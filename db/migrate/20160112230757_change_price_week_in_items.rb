class ChangePriceWeekInItems < ActiveRecord::Migration
  def change
    change_column :items, :price_week, :integer
  end
end
