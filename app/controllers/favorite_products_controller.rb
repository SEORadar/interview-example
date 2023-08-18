class FavoriteProductsController < ApplicationController
  before_action :set_product

  def create
    if FavoriteProduct.create(product: @product, user: current_user)
      flash[:success] = 'Product has been favorited'
    else
      flash[:error] = 'Something went wrong'
    end

    redirect_back(fallback_location: homepage_path)
  end

  def destroy
    FavoriteProduct.where(product_id: @product.id, user_id: current_user.id).first.destroy
    flash[:success] = 'Product has been deleted from favorites'
    redirect_back(fallback_location: homepage_path)
  end

  private

  def set_product
    @product = Product.active.find(params[:product_id] || params[:id])
  end
end
