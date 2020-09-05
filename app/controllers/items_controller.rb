class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  before_action :search_item, only:[:index, :search, :show]

  def index
    @items = Item.all.order("created_at DESC")
    set_item_column
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @results = @p.result.order("created_at DESC")
  end


  private

  def search_item
    @p = Item.ransack(params[:q])
  end

  def set_item_column
    # @category_name = Category.select("name")
  end

  def item_params
    params.require(:item).permit(:name, :info, :price, :image, :category_id, :sales_status_id, :delivery_fee_id, :shipping_area_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
