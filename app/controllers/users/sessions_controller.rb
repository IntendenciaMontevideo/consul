class Users::SessionsController < Devise::SessionsController

  def destroy
    # Preserve the saml_uid in the session
    saml_uid = session["saml_uid"]
    saml_session_index = session["saml_session_index"]
    super do
      session["saml_uid"] = saml_uid
      session["saml_session_index"] = saml_session_index
    end
  end

  private


  def after_sign_in_path_for(resource)
    super
  end

  def verifying_via_email?
    return false if resource.blank?
    stored_path = session[stored_location_key_for(resource)] || ""
    stored_path[0..5] == "/email"
  end

  def after_sign_out_path_for(resource)
    if session['saml_uid']
      session.delete(:saml_uid)
      user_omniauth_authorize_path(:saml) + "/spslo"
    else
      super
    end
  end

end
