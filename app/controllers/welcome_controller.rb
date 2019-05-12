class WelcomeController < ApplicationController
  skip_authorization_check
  before_action :set_user_recommendations, only: :index, if: :current_user

  layout "devise", only: [:welcome, :verification]

  def index
    @recommendations = Widget::Card.body.limit(3)
    @headers = Widget::Card.header
    @recommendation_is_active = recomendation_home?
    @feed_proposal = Widget::Feed.find_by_kind(Widget::Feed::KINDS[0])
    @feed_debate = Widget::Feed.find_by_kind(Widget::Feed::KINDS[1])
  end

  def welcome
  end

  def verification
    redirect_to verification_path if signed_in?
  end

  private

  def set_user_recommendations
    @recommended_debates = Debate.recommendations(current_user).sort_by_recommendations.limit(3)
    @recommended_proposals = Proposal.recommendations(current_user).sort_by_recommendations.limit(3)
  end

  def recomendation_home?
    recomendation = Setting.find_by_key("feature.user.recommendations")
    recomendation && recomendation.value == "active"
  end

end
