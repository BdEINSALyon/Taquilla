ActiveAdmin.register Organization do
  permit_params :name, :location, :contact_email, :website, :description, :parent_organization_id

  index do
    selectable_column
    id_column
    column :name
    column :location
    actions
  end

  filter :name
  filter :contact_email
  filter :website

  form do |f|
    f.inputs I18n.t('admin.organization.identity') do
      f.input :name
      f.input :location
      f.input :parent_organization, collection: Organization.managed_by(current_admin_user)
    end
    f.inputs I18n.t('admin.organization.information') do
      f.input :contact_email
      f.input :website
      f.input :description
    end
    f.actions
  end

  controller do
    def create
      super
      current_admin_user.add_role :admin, resource
    end
  end

end
