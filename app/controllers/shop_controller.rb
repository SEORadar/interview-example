class ShopController < ApplicationController
  def category
    category_slug = params.require([:category_slug])
    @category = Category.find_by!(slug: category_slug)
  end

  def product
    category_slug, product_slug = params.require([:category_slug, :product_slug])
    @category = Category.find_by!(slug: category_slug)
    @product = @category.products.find_by(slug: product_slug)

    render_not_found unless @product&.is_active?
  end
end
