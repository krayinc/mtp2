module AdminHelper
  def custom_table_action(model, item)
    return unless current_user.can?('destroy', model)
    options = { :action => 'destroy', :id => item.id, :controller => "admin/#{model.to_s.pluralize.underscore}" }
    link_to raw(%(<div class="sprite trash">#{_t('destroy'.titleize)}</div>)), options, :title => 'destroy'.titleize, :confirm => _t("Remove %{resource}?", :resource => item.class.model_name.human), :method => :delete
  end
end
