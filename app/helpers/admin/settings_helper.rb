module Admin::SettingsHelper
  def settings_field(setting)
    render :partial => "/admin/settings/#{setting.field_type}", :locals => {:setting => setting}
  end
end