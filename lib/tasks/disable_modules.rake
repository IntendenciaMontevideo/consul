namespace :disable_modules do

  desc "Disable external login and register"
  task external_login: :environment do
    Setting['feature.twitter_login'] = false
    Setting['feature.facebook_login'] = false
    Setting['feature.google_login'] = false
    Setting['feature.saml_login'] = true
  end

  desc "Disable modules"
  task features: :environment do
    Setting['feature.debates'] = true
    Setting['feature.polls'] = false
    Setting['feature.public_stats'] = false
    Setting['feature.budgets'] = false
    Setting['feature.legislation'] = true
    Setting['feature.proposals'] = false
  end
end
