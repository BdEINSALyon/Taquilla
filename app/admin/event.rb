ActiveAdmin.register Event do
  permit_params :name, :location, :start_date, :end_date, :status, :seats, :organization_id

  index do
    selectable_column
    id_column
    column :name
    column :status
    column :start_date
    column :organization, collection: Organization.managed_by(current_admin_user)
    actions
  end

  filter :name
  filter :status, as: :select, collection: Event.statuses
  filter :start_date

  form do |f|
    f.inputs I18n.t('admin.event.about') do
      f.input :name
      f.input :location
      f.input :organization, collection: Organization.managed_by(current_admin_user)
    end
    f.inputs I18n.t('admin.organization.information') do
      f.input :start_date, as: :datepicker
      f.input :end_date,   as: :datepicker
      f.input :status, as: :select, collection: Event.statuses
    end
    f.actions
  end

end
