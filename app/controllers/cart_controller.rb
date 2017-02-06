class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :get_order_item, except: [:index, :checkout]

  def index
    @cart = current_user.cart
  end

  def plus
    unless @order_item.nil?
      @order_item.increment!(:quantity)
    end
    redirect_to cart_index_url
  end

  def minus
    unless @order_item.nil?
      # @order_item.decrement!(:quantity) was not triggering the after:commmit
      # callback. See models/order_item.rb for more
      @order_item.quantity -= 1
      @order_item.save!
    end
    redirect_to cart_index_url
  end

  def checkout
    cart = current_user.cart
    Order.create({user: current_user, order_items: cart.order_items})

    cart.order_items = []
    cart.save!

    redirect_to orders_url, notice: "Your order was sent!"
  end

  protected
    def get_order_item
      cart = current_user.cart
      @order_item = cart.order_items.where({movie_id: params[:id]}).first
    end
end
