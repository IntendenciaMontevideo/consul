module ProposalsHelper

  def progress_bar_percentage(proposal)
    case proposal.cached_votes_up
    when 0 then 0
    when 1..proposal.votes_for_success then (proposal.total_votes.to_f * 100 / proposal.votes_for_success).floor
    else 100
    end
  end

  def supports_percentage(proposal)
    percentage = (proposal.total_votes.to_f * 100 / proposal.votes_for_success)
    case percentage
    when 0 then "0%"
    when 0..0.1 then "0.1%"
    when 0.1..100 then number_to_percentage(percentage, strip_insignificant_zeros: true, precision: 1)
    else "100%"
    end
  end

  def namespaced_proposal_path(proposal, options = {})
    @namespace_proposal_path ||= namespace
    case @namespace_proposal_path
    when "management"
      management_proposal_path(proposal, options)
    else
      proposal_path(proposal, options)
    end
  end

  def retire_proposals_options
    Proposal::RETIRE_OPTIONS.collect { |option| [ t("proposals.retire_options.#{option}"), option ] }
  end

  def options_status_proposal_search
    Proposal::STATES.collect { |option| [ t("proposals.status.#{option[0]}"), option[1] ] }
  end

  def empty_recommended_proposals_message_text(user)
    if user.interests.any?
      t('proposals.index.recommendations.without_results')
    else
      t('proposals.index.recommendations.without_interests')
    end
  end

  def author_of_proposal?(proposal)
    author_of?(proposal, current_user)
  end

  def current_editable?(proposal)
    current_user && proposal.editable_by?(current_user) && proposal.open?
  end

  def resaon_not_success(proposal)

    unless proposal.link_not_success.blank?
      link_to 'más información', proposal.link_not_success, target: '_blank'
    end
  end

  def is_proposal_class(string)
    string == Proposal.to_s
  end

end
