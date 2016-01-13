class ItemsController < ApplicationController

  before_action :is_authenticated?

  def index
    @items = Item.all
    if params[:search]
      @items = Item.search(params[:search]).order("created_at DESC")
    else
      @items = Item.all.order('created_at DESC')
    end
  end

  def create
    @item = Item.create item_params do |i|
      i.user_id = @current_user.id
      i.save
    end
    if @item.save
      flash[:success] = "Item Created"
      redirect_to @current_user
    else
      messages = @item.errors.map { |k, v| "#{k} #{v}" }
      flash[:danger] = messages.join(', ').gsub!(/_/, ' ')
      redirect_to new_item_path
    end

    uploaded = params[:item][:image].path
    cloud_file = Cloudinary::Uploader.upload(uploaded)
    if (File.exists?(uploaded))
      File.delete(uploaded)
    end
    @item.update({:image => cloud_file["public_id"]})

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
    # Update image, if item has an image
    if params[:item][:image]
      uploaded_image = params[:item][:image].path
      cloud_file = Cloudinary::Uploader.upload(uploaded_image)
      if (File.exists?(uploaded_image))
      File.delete(uploaded_image)
      end
      item.update({:image => cloud_file["public_id"]})
    end
    redirect_to items_path
  end

  def destroy
    Item.find(params[:id]).delete
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price_day, :price_week, :start_date, :end_date, :image, :rented)
  end
end
