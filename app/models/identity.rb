class Identity < ActiveRecord::Base
  belongs_to :user

  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }

  SAML_PROVIDER = 'saml'

  def self.first_or_create_from_oauth(auth)
    where(uid: auth.uid, provider: auth.provider).first_or_create
  end
end
