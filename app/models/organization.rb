class Organization < ApplicationRecord

  resourcify

  scope :managed_by, -> (admin) {with_role(:admin, admin)}

  belongs_to :parent_organization, class_name: 'Organization'
  has_many :organizations, :as => :parent_organization
  has_and_belongs_to_many :admin_users
  has_many :events
  has_many :images

end
