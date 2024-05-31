Rails.application.routes.draw do
  get 'orders', to: 'orders#get_orders'
  post 'order', to: 'orders#post_order'
  delete 'order/:id', to: 'orders#delete_order'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "products#get_products"
  # define the paths for the categories
  get 'categories', to: 'categories#get_categories'
  get 'category/:category_name', to: 'categories#get_category_product'
  delete 'category', to: 'categories#delete_category'
  # defines the path for the products
  get 'product/:id', to: 'products#get_product'
  get 'products', to: 'products#get_products'
  post 'product', to: 'products#post_product'
  put 'product/:id', to: 'products#put_product'
  delete 'product/:id', to: 'products#delete_product'
  # defines the paths for the images
  post 'image', to: 'product_images#post_image'
  delete 'image/:id', to: 'product_images#delete_image'
  # defines the paths for the sizes
  post 'size', to: 'product_sizes#post_size'
  delete 'size/:size', to: 'product_sizes#delete_size'
  # defines the routes for abouts
  get 'about_us', to: 'abouts#get_about_us'
  put 'about_us', to: 'abouts#put_about_us'
  post 'about_us', to: 'abouts#post_about_us'
  # define paths for subscribers
  get 'subscribers', to: 'subscribers#get_subscribers'
  put 'subscriber/:id', to: 'subscribers#put_subscriber'
  post 'subscriber', to: 'subscribers#post_subscriber'
end
