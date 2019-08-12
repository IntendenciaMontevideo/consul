class PollsController < ApplicationController
  include PollsHelper

  load_and_authorize_resource

  has_filters %w{current expired incoming}
  has_orders %w{most_voted newest oldest}, only: [:show, :show_question]

  ::Poll::Answer # trigger autoload

  def index
    @polls = @polls.send(@current_filter).includes(:geozones).sort_for_list.page(params[:page])
  end

  def show
    @is_show_question = false
    @questions = @poll.questions.for_render.sort_by_order_number
    @token = poll_voter_token(@poll, current_user)
    @poll_questions_answers = Poll::Question::Answer.joins("Inner JOIN images ON
      images.imageable_id = poll_question_answers.id and
      images.imageable_type= 'Poll::Question::Answer'")
      .where(question: @poll.questions.ids).order(:given_order).distinct

    @answers_by_question_id = {}
    poll_answers = ::Poll::Answer.by_question(@poll.question_ids).by_author(current_user.try(:id))
    poll_answers.each do |answer|
      @answers_by_question_id[answer.question_id] = answer.answer
    end

    @session_answers = {}
    if !current_user.blank? && @answers_by_question_id.blank?
      session[current_user.id.to_s].blank? ? @session_answers = {} : @session_answers = session[current_user.id.to_s][@poll.id.to_s].blank? ? {} : session[current_user.id.to_s][@poll.id.to_s]
    end

    @commentable = @poll
    @comment_tree = CommentTree.new(@commentable, params[:page], @current_order)

    @can_vote = true
    if @token.blank?
      @can_vote = validate_can_vote(current_user, @poll)
    end

  end

  def show_question
    @is_show_question = true
    @questions = [Poll::Question.find(params[:question].to_i)]
    @token = poll_voter_token(@poll, current_user)
    @poll_questions_answers = Poll::Question::Answer.joins("Inner JOIN images ON
      images.imageable_id = poll_question_answers.id and
      images.imageable_type= 'Poll::Question::Answer'")
      .where(question: @questions).order(:given_order).distinct

    @answers_by_question_id = {}
    poll_answers = ::Poll::Answer.by_question(@questions.first.id).by_author(current_user.try(:id))
    poll_answers.each do |answer|
      @answers_by_question_id[answer.question_id] = answer.answer
    end

    @session_answers = {}
    if !current_user.blank? && @answers_by_question_id.blank?
      session[current_user.id.to_s].blank? ? @session_answers = {} : @session_answers = session[current_user.id.to_s][@poll.id.to_s].blank? ? {} : session[current_user.id.to_s][@poll.id.to_s]
    end

    @commentable = @poll
    @comment_tree = CommentTree.new(@commentable, params[:page], @current_order)

    @can_vote = true
    if @token.blank?
      @can_vote = validate_can_vote(current_user, @poll)
    end

    render 'show'
  end

  def stats
    @is_show_question = false
    @stats = Poll::Stats.new(@poll).generate
  end

  def results
    @is_show_question = false
  end

end
