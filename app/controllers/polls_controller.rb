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
    @questions = @poll.questions.for_render.sort_for_list
    @token = poll_voter_token(@poll, current_user)
    @poll_questions_answers = Poll::Question::Answer.joins("Inner JOIN images ON images.imageable_id = poll_question_answers.id and images.imageable_type= 'Poll::Question::Answer'").where(question: @poll.questions.ids).order(:given_order)

    @answers_by_question_id = {}
    poll_answers = ::Poll::Answer.by_question(@poll.question_ids).by_author(current_user.try(:id))
    poll_answers.each do |answer|
      @answers_by_question_id[answer.question_id] = answer.answer
    end

    @session_answers = {}
    if @answers_by_question_id.blank?
      session[@poll.id].blank? ? @session_answers = {} : @session_answers = session[@poll.id]
    end

    @commentable = @poll
    @comment_tree = CommentTree.new(@commentable, params[:page], @current_order)
  end

  def show_question
    @is_show_question = true
    @questions = [Poll::Question.find(params[:question].to_i)]
    @token = poll_voter_token(@poll, current_user)
    @poll_questions_answers = Poll::Question::Answer.joins("Inner JOIN images ON images.imageable_id = poll_question_answers.id and images.imageable_type= 'Poll::Question::Answer'").where(question: @poll.questions).order(:given_order)

    @answers_by_question_id = {}
    poll_answers = ::Poll::Answer.by_question(@questions.first.id).by_author(current_user.try(:id))
    poll_answers.each do |answer|
      @answers_by_question_id[answer.question_id] = answer.answer
    end

    @commentable = @poll
    @comment_tree = CommentTree.new(@commentable, params[:page], @current_order)

    render 'show'

  end

  def stats
    @is_show_question = false
    @stats = Poll::Stats.new(@poll).generate
  end

  def results
    @is_show_question = false
  end

  def vote
    @token = poll_voter_token(@poll, current_user)

    if @token.blank?
      session[@poll.id].each do |question_answer|
        question = @poll.questions.find(question_answer[0].to_i)
        answer = question.answers.find_or_initialize_by(author: current_user)
        @token = params[:token]
        answer.answer = question.question_answers.find(question_answer[1].to_i).title
        answer.touch if answer.persisted?
        answer.save!

        answer.record_voter_participation(@token)
        question.question_answers.where(question_id: question).each do |question_answer|
          question_answer.set_most_voted
        end
      end
      session.delete(@poll.id.to_s)
      Mailer.email_ticket_vote(@poll, @token, current_user).deliver_later
      @exist_vote = false
    else
      @exist_vote = true
    end
  end

end
