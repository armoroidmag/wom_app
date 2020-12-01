class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to item_path(@item)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "アイテムを更新しました。"
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit( :item_name,:location, :price, :best_before_date, :content, :image)
  end

end
