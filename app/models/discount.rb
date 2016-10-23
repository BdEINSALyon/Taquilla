class Discount < ApplicationRecord
  belongs_to :event
  has_many :carts

  def compute(price)
    price = (price * ((100-percent_off)/100)) if percent_off > 0
    price = (price - amount_off) if amount_off > 0
    price
  end
end
