module Typus::Authentication::Session
  def check_if_user_can_perform_action_on_user_with_update_patch
    return unless @item.kind_of?(Typus.user_class)
    if params[:action] == 'update'
      if current_user.is_not_root? && (@item.role != params[@object_name][:role])
        message = _t("You can't change your role.")
      elsif current_user.is_root? && (current_user === @item) && (@item.role != params[@object_name][:role])
        message = _t("You can't change your role.")
      end
      redirect_to set_path, :notice => message if message
    else
      check_if_user_can_perform_action_on_user_without_update_patch
    end
  end
  alias_method_chain :check_if_user_can_perform_action_on_user, :update_patch
end
