class AdminUser < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :organizations

  def name
    if first_name.nil? and last_name.nil?
      email
    else
      "#{first_name} #{last_name}"
    end
  end
end
