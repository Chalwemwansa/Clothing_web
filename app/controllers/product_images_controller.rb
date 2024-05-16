class ProductImagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def post_image
    uploaded_image = params[:image]

    if uploaded_file.present? && uploaded_file.respond_to?(:tempfile)
      file_name = Time.now.strftime("%Y%m%d%H%M%S") + '_' + uploaded_file.original_filename
      file_path = Rails.root.join('public', 'uploads', file_name)
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end

      image_url = "http://localhost:3000/uploads/#{file_name}"

      new_params = params.reject{ |key, _| key == 'image'}
      new_params['image_url'] = image_url
      new_image_id = Product_image.create(new_params)

      render json: { 'image_id': new_image_id }, status: :created
    else
      render json: { error: 'No file uploaded' }, status: :failed
    end
  end

  def delete_image
    image_id = params[:id]
    image = Product_image.find(image_id)
    image.:destroy
    if image.nil?
      render json: "successful"
    else
      render json: "failed"
    end
  end
end
