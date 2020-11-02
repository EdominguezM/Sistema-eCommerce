require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    
    @father = Category.create(id:1, name: 'Hijo')
    @son = Category.create(id:2,name: 'Nieto')
    @grandfather = Category.create(id:3, name: 'Abuelo')
    Category.find(2).update(parent_category_id: 1)
    Category.find(1).update(parent_category_id: 3)
    
  end  
  

  test "returns the children" do
    assert_equal @grandfather.descendents.map{|x| x.name}, ["Hijo", "Nieto" ]
  end


  test "returns the parents" do
    assert_equal @father.all_parents, ["" ]
  end 
end
