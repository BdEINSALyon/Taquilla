ActiveAdmin.register AdminUser do
  permit_params :email, :first_name, :last_name, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs I18n.t('admin.user.identity') do
      f.input :first_name
      f.input :last_name
    end
    f.inputs I18n.t('admin.user.login') do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
