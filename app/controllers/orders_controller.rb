class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def get_orders
    orders = Order.all
    render json: orders
  end

  def delete_order
    order = Order.find_by(id: params[:id])
    if order
      order.destroy
      render json: "success"
    else
      render json: "failed"
    end
  end

  def post_order
    new_params = params.permit(:name, :number, :email, :size, :product_id)
    order = Order.create(new_params)
    render json: order
  end
end
