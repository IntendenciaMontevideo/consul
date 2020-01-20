class Polls::QuestionsController < ApplicationController
  include PollsHelper

  load_and_authorize_resource :poll
  load_and_authorize_resource :question, class: 'Poll::Question'

  has_orders %w{most_voted newest oldest}, only: :show

  def create_session_answer
    @poll = Poll.find(params[:poll_id].to_i)
    @same_group_poll = Poll.find_same_group_poll(@poll).pluck(:id)
    @can_vote_session = session[current_user.id.to_s].blank? ? true : validate_can_vote_session(session[current_user.id.to_s], @poll, @same_group_poll)
    @token = poll_voter_token(@poll, current_user)

    if (@can_vote_session || session[current_user.id.to_s].blank?) && @token.blank?
      session[current_user.id.to_s] ||= {}
      session[current_user.id.to_s][@poll.id.to_s] ||= {}
      if session[current_user.id.to_s][@poll.id.to_s][@question.id.to_s] == params[:answer_id]
        session[current_user.id.to_s][@poll.id.to_s].delete(@question.id.to_s)
        if session[current_user.id.to_s][@poll.id.to_s].blank?
          session[current_user.id.to_s].delete(@poll.id.to_s)
        end
        @is_select_answer = false
      else
        if session[current_user.id.to_s][@poll.id.to_s].count <= @poll.number_votes_allowed
          session[current_user.id.to_s][@poll.id.to_s][@question.id.to_s] = params[:answer_id]
        end
        @id_answer_selected = params[:answer_id]
        @id_question_answer = @question.id.to_s
        @is_select_answer = true
      end
    end

    @can_vote = validate_can_vote(current_user, @poll)
    @session_answers = session[current_user.id.to_s][@poll.id.to_s].blank? ? {} : session[current_user.id.to_s][@poll.id.to_s]
    @questions = @poll.questions.for_render.sort_by_order_number

  end

  def vote
    @token = poll_voter_token(@poll, current_user)
    @poll = Poll.find(params[:poll_id].to_i)
    @questions = @poll.questions.for_render.sort_by_order_number

    if @token.blank?
      if session[current_user.id.to_s][@poll.id.to_s].count <= @poll.number_votes_allowed
        session[current_user.id.to_s][@poll.id.to_s].each do |question_answer|
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
        session[current_user.id.to_s].delete(@poll.id.to_s)
        Mailer.email_ticket_vote(@poll, @token, current_user).deliver_now
        @exist_vote = false
        @number_votes_allowed = true
      else
        @number_votes_allowed = false
      end
    else
      @exist_vote = true
      session[current_user.id.to_s].delete(@poll.id.to_s)
    end
    @session_answers = session[current_user.id.to_s][@poll.id.to_s].blank? ? {} : session[current_user.id.to_s][@poll.id.to_s]
  end

  def show_modal_vote
    @poll = Poll.find(params[:poll_id].to_i)
    @session_answers = session[current_user.id.to_s][@poll.id.to_s].blank? ? {} : session[current_user.id.to_s][@poll.id.to_s]
  end

  def clean_session_same_group
    @poll = Poll.find(params[:poll_id].to_i)
    same_group_poll = Poll.find_same_group_poll(@poll).pluck(:id)
    if params[:clean_own_poll] == 'true'
      session[current_user.id.to_s].delete(@poll.id.to_s)
      @questions = @poll.questions.for_render.sort_by_order_number
      @session_answers = session[current_user.id.to_s][@poll.id.to_s].blank? ? {} : session[current_user.id.to_s][@poll.id.to_s]
      @can_vote = validate_can_vote(current_user, @poll)
      @clean_own_poll = true
    else
      same_group_poll.each do |poll_id|
        if !session[current_user.id.to_s][poll_id.to_s].blank?
          session[current_user.id.to_s].delete(poll_id.to_s)
        end
      end
      @clean_own_poll = false
    end
  end

  def change_selection
    @poll = Poll.find(params[:poll_id].to_i)
    session[current_user.id.to_s][@poll.id.to_s].delete(@question.id.to_s)
    if session[current_user.id.to_s][@poll.id.to_s].blank?
      session[current_user.id.to_s].delete(@poll.id.to_s)
    end
    @session_answers = session[current_user.id.to_s][@poll.id.to_s].blank? ? {} : session[current_user.id.to_s][@poll.id.to_s]
    @questions = @poll.questions.for_render.sort_by_order_number
    @can_vote = validate_can_vote(current_user, @poll)
  end
end
