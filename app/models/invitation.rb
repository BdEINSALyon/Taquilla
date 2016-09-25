class Invitation < ApplicationRecord
  belongs_to :user
  has_many :tickets
  has_and_belongs_to_many :passes

  def use_for(pass, cart)
    if passes.include? pass and tickets.where(pass: pass).count < passes.where(id: pass.id).count
      tickets.create! pass: pass, cart: cart, status: 'buying', email: email
    else
      nil
    end
  end
end
