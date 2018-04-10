namespace :set_data do

  desc "Disable external login and register"
  task external_login: :environment do
    Setting['feature.twitter_login'] = false
    Setting['feature.facebook_login'] = true
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
    Setting['feature.proposals'] = true
    Setting['feature.allow_images'] = true
  end

  desc "Set data"
  task set_data: :environment do
    Setting["proposal_code_prefix"] = 'MVD'
    Setting['proposals_vote_start_day'] = 1
    Setting['proposals_vote_start_month'] = 4
    Setting['proposals_vote_end_day'] = 31
    Setting['proposals_vote_end_month'] = 3
    Setting['proposals_feasibility_threshold'] = 500
    Setting['feature.allow_images'] = true
  end
end
