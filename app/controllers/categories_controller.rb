class CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def get_categories
    categories = Category.all
    render json: categories
  end

  def get_category_product
    category = params[:category_name]
    category = Category.find_by(name: category)
    if category
      products = category.products.includes(:product_images, :product_sizes).all
      render json: products.as_json(
        include: {
        product_images: { only: [:image_url] },
        product_sizes: { only: [:size] }
        }
      )
    else
      render json: "no such category"
    end
  end

  def delete_category
    category = Category.find_by(name: params[:category_name])
    if category
      category.destroy
      render json: "success"
    else
      render json: "failed"
    end
  end
end
