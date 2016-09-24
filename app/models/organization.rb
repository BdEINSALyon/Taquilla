class Organization < ApplicationRecord
  belongs_to :parent_organization, class_name: 'Organization'
  has_many :organizations, :as => :parent_organization
  has_and_belongs_to_many :admin_users
end
