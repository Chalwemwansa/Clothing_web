class SubscribersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def get_subscribers
    subscribers = Subscriber.all
    render json: subscribers
  end

  def put_subscriber
    subscriber = Subscriber.find(params[:id])
    if subscriber.update(email: params[:email])
      render json: "success"
    else
      render json: "failed"
    end
  end

  def post_subscriber
    new_params = params.permit(:email)
    subscriber = Subscriber.create(new_params)
    render json: {"subscriber_id": subscriber.id}
  end

end
