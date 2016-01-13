class ItemsController < ApplicationController

  before_action :is_authenticated?

  def index
    @items = Item.all
  end

  def create
    @item = Item.create item_params do |i|
      i.user_id = @current_user.id
      i.save
    end
    if @item.save
      flash[:success] = "Item Created"
      redirect_to items_path
    else
      messages = @item.errors.map { |k, v| "#{k} #{v}" }
      flash[:danger] = messages.join(', ').gsub!(/_/, ' ')
      redirect_to new_item_path
    end
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find params[:id]
  end

  def show
    @item = Item.find params[:id]
  end

  def update
    item = Item.find params[:id]
    item.update item_params
    redirect_to items_path
  end

  def destroy
    Item.find(params[:id]).delete
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price_day, :price_week, :start_date, :end_date)
  end
end
