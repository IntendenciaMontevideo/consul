class WelcomeController < ApplicationController
  skip_authorization_check
  before_action :set_user_recommendations, only: :index, if: :current_user

  layout "devise", only: [:welcome, :verification]

  def index
    @recommendations = Widget::Card.body
    @headers = load_widget_cards.sort_by { |obj| obj.order_number }
    @recommendation_is_active = recomendation_home?
    @feed_proposal = Widget::Feed.find_by_kind(Widget::Feed::KINDS[0])
    @feed_debate = Widget::Feed.find_by_kind(Widget::Feed::KINDS[1])
    load_home_links
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

  def load_widget_cards
    cards = Widget::Card.header
    cards.without_init_end_datetime + cards.only_with_init_datetime + cards.only_with_end_datetime + cards.with_init_end_datetime
  end

  def load_home_links
    @show_buttons = Setting['home_show_buttons']
    @statitics_link = Setting['home_statistics']
    @proposals_link = Setting['home_winning_proposals']
    @cycle_link = Setting['home_next_cycle']
    @memory_link = Setting['home_memory']
  end

end
