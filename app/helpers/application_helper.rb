module ApplicationHelper
  def back_link(link)
    link_to link, class: 'btn btn-default' do
      content_tag(:i, '', class: 'fa fa-arrow-left') +
      content_tag(:span, ' Retour')
    end
  end
end
