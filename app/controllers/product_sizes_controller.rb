class ProductSizesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def post_size
    size = ProductSize.find_by(size: params[:size])
    if size
      render json: "size already exists"
    else
      new_params = params.permit(:product_id, :size)
      new_size = ProductSize.create(new_params)
      render json: {'size_id': new_size.id}
    end
  end

  def delete_size
    size = ProductSize.find_by(size: params[:size])
    if size
      size.destroy
      render json: "success"
    else
      render json: "failed"
    end
  end
end
