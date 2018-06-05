class WelcomeController < ApplicationController
  def index
    @product = Product.new
  end

  def users
    @users = User.all
    # this is the only way the app will have something to show
  end

  def products
    @products = Product.all
  end

  def create_users
    user = User.create(name: params[:name], age: params[:age])
    # name: params[:name] - It's taking the input and packaging it as a param. So params gets set up by user input from the form. The params is the key and name is a value.
    redirect_to users_path
    # The newly created user object is redirected to the users all view.
  end

  def create_products
    
    product = Product.create(product_params)
    redirect_to products_path
  end

  private
  # Google Mass Assignment Vulnerability
  def product_params
    param.require(:product).permit(:name, :price, :quantity)
    # security feature call strong parameters that tells exactly what's allowed as input.
  end
end
