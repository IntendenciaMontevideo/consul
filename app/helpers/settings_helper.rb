module SettingsHelper

  def feature?(name)
    setting["feature.#{name}"].presence
  end

  def setting
    @all_settings ||= Hash[ Setting.all.map{|s| [s.key, s.value.presence]} ]
  end

  def show_in_production
    value_show = setting["show_in_production"]
    value_show && (value_show == 'true' || value_show == 't')
  end

  def setting_for_widget(widget)
    Setting.where(key: 'feature.user.recommendations').first
  end

end
