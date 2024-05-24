class ProductImagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def post_image
    uploaded_image = params[:image]

    if uploaded_image.present? && uploaded_image.respond_to?(:tempfile)
      file_name = Time.now.strftime("%Y%m%d%H%M%S") + '_' + uploaded_image.original_filename
      file_path = Rails.root.join('public', 'uploads', file_name)
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_image.read)
      end

      image_url = "/uploads/#{file_name}"
      new_params = params.permit(:image_url, :product_id)
      new_params['image_url'] = image_url
      new_image = ProductImage.create(new_params)

      render json: {'image_id': new_image.id }, status: :created
    else
      render json: { error: 'No file uploaded' }, status: :failed
    end
  end

  def delete_image
    image = ProductImage.find_by(id: params[:id])
    if image
      file_path = 'public' + image.image_url
      print file_path
      File.delete(file_path) if File.exist?(file_path)
      print file_path
      image.destroy
      render json: "successful"
    else
      render json: "failed"
    end
  end
end
