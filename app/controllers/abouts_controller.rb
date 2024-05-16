class AboutsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def get_about_us
    about = About.first
    render json: {"about_us": about}
  end

  def put_about_us
    about = About.first
    if about
      new_params = params.permit(:content)
      about.update(new_params)
      render json: "success"
    else
      render json: "failed"
    end
  end

  def post_about_us
    if About.first
      render json: "about already exits, edit it using put"
    else
      new_params = params.permit(:content)
      About.create(new_params)
      render json: "Ok"
    end
  end
end
