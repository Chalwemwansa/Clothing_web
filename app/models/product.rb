class Product < ApplicationRecord
  belongs_to :category
  has_many :product_images, dependent: :destroy
  has_many :product_sizes, dependent: :destroy
  has_many :orders, dependent: :destroy
end
