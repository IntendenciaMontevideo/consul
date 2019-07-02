class UserSegments
  SEGMENTS = %w(all_users
                administrators
                level_1
                level_2
                level_3
                proposal_authors
                active_proposal_authors
                )

  def self.all_users
    User.enabled_to_send_by_mail
  end

  def self.administrators
    all_users.administrators
  end

  def self.level_1
    all_users.joins(:identities).where.not("identities.provider": "saml").distinct
  end

  def self.level_2
    all_users.joins(:identities).where("identities.provider": "saml", verified_at: nil).distinct
  end

  def self.level_3
    all_users.joins(:identities).where("identities.provider": "saml").where.not(verified_at: nil).distinct
  end

  def self.proposal_authors
    author_ids(Proposal.not_retired.pluck(:author_id).uniq)
  end

  def self.active_proposal_authors
    author_ids(Proposal.not_archived.not_retired.pluck(:author_id).uniq)
  end

  def self.investment_authors
    author_ids(current_budget_investments.pluck(:author_id).uniq)
  end

  def self.feasible_and_undecided_investment_authors
    unfeasible_and_finished_condition = "feasibility = 'unfeasible' and valuation_finished = true"
    investments = current_budget_investments.where.not(unfeasible_and_finished_condition)
    author_ids(investments.pluck(:author_id).uniq)
  end

  def self.selected_investment_authors
    author_ids(current_budget_investments.selected.pluck(:author_id).uniq)
  end

  def self.winner_investment_authors
    author_ids(current_budget_investments.winners.pluck(:author_id).uniq)
  end

  def self.user_segment_emails(users_segment)
    UserSegments.send(users_segment).includes(:identities)
  end

  private

  def self.current_budget_investments
    Budget.current.investments
  end

  def self.author_ids(author_ids)
    all_users.where(id: author_ids)
  end
end
