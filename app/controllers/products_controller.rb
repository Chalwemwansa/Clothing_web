class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def get_products
    products = Product.includes(:product_images, :product_sizes).all
    render json: products.as_json(
      include: {
        product_images: { only: [:image_url] },
      product_sizes: { only: [:size] }
    }
  )
  end

  def get_product
    product = Product.includes(:product_images, :product_sizes).find_by(id: params[:id])
    if product
      render json: product.as_json(
        include: {
          product_images: { only: [:image_url, :id] },
          product_sizes: { only: [:size, :id] }
      }
    )
    else
      render json: "failed"
    end

  end

  def post_product
    if (!Category.exists?(name: params[:category_name]))
      category = Category.create(name: params[:category_name])
    else
      category = Category.find_by(name: params[:category_name])
    end
    category_id = category.id
    new_params = params.permit(:name, :price, :description,
                               :details, :shipping_details)
    new_params['category_id'] = category_id
    product = Product.create(new_params)
    render json: {"product_id": product.id}
  end

  def put_product
    if params[:category_name]
      category = Category.find_or_create_by(name: params[:category_name])
      params[:category_id] = category.id
    end
    product = Product.find_by(id: params[:id])
    if product
      new_params = params.permit(:name, :price, :description, :category_id,
                                :details, :shipping_details)
      product.update(new_params)
      render json: "success"
    else
      render json: "failed"
    end
  end

  def delete_product
    product = Product.find_by(id: params[:id])
    if product
      product.destroy
      render json: "success"
    else
      render json: "failed"
    end
  end

end
