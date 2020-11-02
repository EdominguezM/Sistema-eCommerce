class Category < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :parent_category, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_category_id'

  #attr_accessor: :name, :parent_category
  def all_parents
    all_parents=[]
    current_category = self
    while current_category.parent_category.present?
      all_parents << current_category.parent_category
      current_category = current_category.parent_category
    end
    all_parents
  
  end



  def descendents
    children.map { |child| [child] + child.descendents }.flatten
  end
end
