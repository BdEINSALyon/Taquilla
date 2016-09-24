ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc{ I18n.t('active_admin.dashboard') }

  content title: proc{ I18n.t('active_admin.dashboard') } do
    if Organization.managed_by(current_admin_user).count <= 0
      div class: 'blank_slate_container', id: 'dashboard_default_message' do
        span class: 'blank_slate' do
          div I18n.t('admin.dashboard.first_welcome')
          br
          a 'Enregistrer mon organisation', class: 'button', href: new_admin_organization_path
        end
      end
    else
      columns do
          column do
            panel I18n.t('admin.dashboard.my_events') do
              ul do
                Event.where(organization_id: Organization.managed_by(current_admin_user).pluck(:id)).map do |event|
                  li link_to(event.name, admin_event_path(event))
                end
              end
            end
          end

          column do
            panel "Info" do
              para "Bienvenu #{current_admin_user.name}"
            end
          end
        end
    end


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
