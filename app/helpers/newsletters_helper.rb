module NewslettersHelper

  def status_name(status)
    I18n.t("admin.newsletter.status_name.#{Newsletter::STATUS.invert[status].to_s}")
  end
end
