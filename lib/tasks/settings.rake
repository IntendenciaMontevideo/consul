namespace :settings do

  desc "Changes Setting key per_page_code for per_page_code_head"
  task per_page_code_migration: :environment do
    per_page_code_setting = Setting.where(key: 'per_page_code').first

    Setting['per_page_code_head'] = per_page_code_setting&.value.to_s if Setting.where(key: 'per_page_code_head').first.blank?
    per_page_code_setting.destroy if per_page_code_setting.present?
  end

  desc "Add Setting key enable_participatory_budget"
  task add_enable_participatory_budget: :environment do
    setting = Setting.find_by_key 'enable_participatory_budget'
    if setting.blank?
      Setting['enable_participatory_budget'] = "false"
    end
  end

  desc "Add Setting key enable_unique_image_banner"
  task add_enable_unique_image_banner: :environment do
    setting = Setting.find_by_key 'enable_unique_image_banner'
    if setting.blank?
      Setting['enable_unique_image_banner'] = "false"
    end
  end

end
