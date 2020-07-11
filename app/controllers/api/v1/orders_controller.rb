class Api::V1::OrdersController < ApplicationController
  def create
    order = Order.create(user: current_user)
    order.order_items.create(product_id: params[:product_id])
    render json: { message: 'The product has been added to your order', order_id: order.id }
  end
  def update
    order = Order.find(params[:id])
    product = Product.find(params[:product_id])
    order.order_items.create(product: product)
    render json: { message: 'The product has been added to your order', order_id: order.id }
  end
end