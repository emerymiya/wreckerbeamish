class Owner::ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.create(course_params)
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

  def course_params
    params.require(:product).permit(:title, :description, :cost)
  end
end