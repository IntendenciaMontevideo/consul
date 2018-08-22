module PollsHelper

  def poll_select_options(include_all = nil)
    options = @polls.collect do |poll|
      [poll.name, current_path_with_query_params(poll_id: poll.id)]
    end
    options << all_polls if include_all
    options_for_select(options, request.fullpath)
  end

  def all_polls
    [I18n.t("polls.all"), admin_questions_path]
  end

  def poll_dates(poll)
    if poll.starts_at.blank? || poll.ends_at.blank?
      I18n.t("polls.no_dates")
    else
      I18n.t("polls.dates", open_at: l(poll.starts_at.to_date), closed_at: l(poll.ends_at.to_date))
    end
  end

  def poll_dates_select_options(poll)
    options = []
    (poll.starts_at.to_date..poll.ends_at.to_date).each do |date|
      options << [l(date, format: :long), l(date)]
    end
    options_for_select(options, params[:d])
  end

  def poll_booths_select_options(poll)
    options = []
    poll.booths.each do |booth|
      options << [booth_name_with_location(booth), booth.id]
    end
    options_for_select(options)
  end

  def booth_name_with_location(booth)
    location = booth.location.blank? ? "" : " (#{booth.location})"
    booth.name + location
  end

  def poll_voter_token(poll, user)
    if user.nil?
      ''
    else
      Poll::Voter.where(poll: poll, document_number: user.document_number, origin: "web").first&.token || ''
    end
  end

  def validate_can_vote(user, poll)
    if user.nil?
      false
    else
      Poll::Voter
      .joins(:poll)
      .where(document_number: user.document_number, origin: "web",
        polls:{poll_group_id: poll.poll_group_id}).blank? || poll.poll_group_id.blank? ? true : false
    end
  end

  def validate_can_vote_session(session_current_user, poll, same_group_poll)
    can_vote = true
    if !same_group_poll.blank?
      same_group_poll.each do |poll_id|
        can_vote = session_current_user.select{|key, hash| key== poll_id.to_s}.blank? ? true : false
        if !can_vote
          break
        end
      end
    end
    return can_vote
  end

  def voted_before_sign_in(question)
    question.answers.where(author: current_user).any? { |vote| current_user.current_sign_in_at >= vote.updated_at }
  end

  def options_access_level
    Poll::ACCESS_LEVEL.collect { |key, value| [t("admin.polls.new.#{key}"), value] }
  end

end
