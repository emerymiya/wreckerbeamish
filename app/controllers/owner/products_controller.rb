class Owner::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_product, only: [:show]
  
  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.create(product_params)
    if @product.valid?
      redirect_to owner_product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def require_authorized_for_current_product
    if current_product.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end

  helper_method :current_product
  def current_product
    @current_product ||= Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :cost, :image)
  end
end