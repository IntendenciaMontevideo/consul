section "Creating Settings" do
  Setting.create(key: 'official_level_1_name',
                 value: I18n.t('seeds.settings.official_level_1_name'))
  Setting.create(key: 'official_level_2_name',
                 value: I18n.t('seeds.settings.official_level_2_name'))
  Setting.create(key: 'official_level_3_name',
                 value: I18n.t('seeds.settings.official_level_3_name'))
  Setting.create(key: 'official_level_4_name',
                 value: I18n.t('seeds.settings.official_level_4_name'))
  Setting.create(key: 'official_level_5_name',
                 value: I18n.t('seeds.settings.official_level_5_name'))
  Setting.create(key: 'max_ratio_anon_votes_on_debates', value: '50')
  Setting.create(key: 'max_votes_for_debate_edit', value: '1000')
  Setting.create(key: 'max_votes_for_proposal_edit', value: '1000')
  Setting.create(key: 'proposal_code_prefix', value: 'MVD')
  Setting.create(key: 'votes_for_proposal_success', value: '100')
  Setting.create(key: 'months_to_archive_proposals', value: '12')
  Setting.create(key: 'comments_body_max_length', value: '1000')

  Setting.create(key: 'twitter_handle', value: '@consul_dev')
  Setting.create(key: 'twitter_hashtag', value: '#MontevideoDecide')
  Setting.create(key: 'facebook_handle', value: 'CONSUL')
  Setting.create(key: 'youtube_handle', value: 'CONSUL')
  Setting.create(key: 'telegram_handle', value: 'CONSUL')
  Setting.create(key: 'instagram_handle', value: 'CONSUL')
  Setting.create(key: 'blog_url', value: '/blog')
  Setting.create(key: 'url', value: 'http://localhost:3000')
  Setting.create(key: 'org_name', value: 'CONSUL')
  Setting.create(key: 'place_name', value: 'City')

  Setting.create(key: 'feature.debates', value: "true")
  Setting.create(key: 'feature.proposals', value: "true")
  Setting.create(key: 'feature.polls', value: "true")
  Setting.create(key: 'feature.spending_proposals', value: nil)
  Setting.create(key: 'feature.spending_proposal_features.voting_allowed', value: nil)
  Setting.create(key: 'feature.budgets', value: "true")
  Setting.create(key: 'feature.twitter_login', value: "true")
  Setting.create(key: 'feature.facebook_login', value: "true")
  Setting.create(key: 'feature.google_login', value: "true")
  Setting.create(key: 'feature.saml_login', value: "true")
  Setting.create(key: 'feature.signature_sheets', value: "true")
  Setting.create(key: 'feature.legislation', value: "true")
  Setting.create(key: 'feature.user.recommendations', value: "true")
  Setting.create(key: 'feature.community', value: "true")
  Setting.create(key: 'feature.map', value: "true")
  Setting.create(key: 'feature.allow_images', value: "true")
  Setting.create(key: 'feature.public_stats', value: "true")
  Setting.create(key: 'feature.guides', value: nil)

  Setting.create(key: 'per_page_code_head', value: "")
  Setting.create(key: 'per_page_code_body', value: "")
  Setting.create(key: 'comments_body_max_length', value: '1000')
  Setting.create(key: 'mailer_from_name', value: 'CONSUL')
  Setting.create(key: 'mailer_from_address', value: 'noreply@consul.dev')
  Setting.create(key: 'meta_title', value: 'CONSUL')
  Setting.create(key: 'meta_description', value: 'Citizen Participation & Open Gov Application')
  Setting.create(key: 'meta_keywords', value: 'citizen participation, open government')
  Setting.create(key: 'verification_offices_url', value: 'http://oficinas-atencion-ciudadano.url/')
  Setting.create(key: 'min_age_to_participate', value: '16')
  Setting.create(key: 'proposal_improvement_path', value: nil)
  Setting.create(key: 'map_latitude', value: 40.41)
  Setting.create(key: 'map_longitude', value: -3.7)
  Setting.create(key: 'map_zoom', value: 10)
  Setting.create(key: 'related_content_score_threshold', value: -0.3)
  Setting.create(key: 'show_in_production', value: "false")
  # Period create proposal
  Setting.create(key: 'proposals_start_day', value: 1)
  Setting.create(key: 'proposals_start_month', value: 4)
  Setting.create(key: 'proposals_end_day', value: 31)
  Setting.create(key: 'proposals_end_month', value: 10)
  #Period vote proposal
  Setting.create(key: 'proposals_vote_start_day', value: 1)
  Setting.create(key: 'proposals_vote_start_month', value: 4)
  Setting.create(key: 'proposals_vote_end_day', value: 31)
  Setting.create(key: 'proposals_vote_end_month', value: 3)
  Setting.create(key: 'proposals_feasibility_threshold', value: 500)

  Setting.create(key: 'url_registration_saml', value: 'https://mi.iduruguay.gub.uy/registro')

  #Enable participatory budget
  Setting.create(key: 'enable_participatory_budget', value: "false")
  Setting.create(key: 'enable_unique_image_banner', value: "false")

  Setting['feature.homepage.widgets.feeds.proposals'] = true
  Setting['feature.homepage.widgets.feeds.debates'] = true
  Setting['feature.homepage.widgets.feeds.processes'] = true

end
