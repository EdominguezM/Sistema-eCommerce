class BaseProduct < ApplicationRecord

  has_many :products

  

  def children
    children = self.products.filter_by_stock
  end

  def stock_products
    self.products.filter_by_stock.sum(:stock)
  end
end
