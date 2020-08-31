class TransactionsController < ApplicationController
  before_action :set_item, only:[:index, :create, :pay_item, :move_to_top]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @transaction = DealTransaction.new
    if (current_user.id == @item.user.id) || @item.deal
      redirect_to root_path
    end

  end

  def create
    @transaction = DealTransaction.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      redirect_to root_path
    else
      render :index
    end

  end


  private
                         
  def transaction_params
    binding.pry
    params.require(:deal_transaction).permit( :postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item= Item.find(params[:item_id])
  end


end
