class Coupon < ApplicationRecord
  validates_numericality_of :amount, on: :create, message:"no es numero"
  validates_uniqueness_of :code, on: :create, message: "debe ser unico", case_sensitive: false

  has_many :orders

  enum status: [:true, :false]

  
  def is_valid?
    (self.expiration.nil? || self.expiration >= Date.current) && (self.limit == 0 || self.limit > self.used)   
  end

  def discount(total) #si es valido el cupon aplica el descuento correspondiente
    price = if is_valid?
              percentage ? total - (total * (amount/100)) :  (total - amount)
            else  
              total
            end
    return price.floor
  end
end
