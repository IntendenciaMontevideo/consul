class Polls::QuestionsController < ApplicationController
  include PollsHelper

  load_and_authorize_resource :poll
  load_and_authorize_resource :question, class: 'Poll::Question'

  has_orders %w{most_voted newest oldest}, only: :show

  def create_session_answer
    @poll = Poll.find(params[:poll_id].to_i)
    @questions = @poll.questions.for_render.sort_for_list
    session[current_user.id.to_s] ||= {}
    session[current_user.id.to_s][@poll.id.to_s] ||= {}

    if session[current_user.id.to_s][@poll.id.to_s][@question.id.to_s] == params[:answer_id]
      session[current_user.id.to_s][@poll.id.to_s].delete(@question.id.to_s)
      if session[current_user.id.to_s][@poll.id.to_s].blank?
        session[current_user.id.to_s].delete(@poll.id.to_s)
      end
      @is_select_answer = false
    else
      session[current_user.id.to_s][@poll.id.to_s][@question.id.to_s] = params[:answer_id]
      @is_select_answer = true
    end
    @session_answers = session[current_user.id.to_s][@poll.id.to_s].blank? ? {} : session[current_user.id.to_s][@poll.id.to_s]

    @can_vote = validate_can_vote(current_user, @poll)
  end

  def vote
    @token = poll_voter_token(@poll, current_user)
    @poll = Poll.find(params[:poll_id].to_i)

    if @token.blank?
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
      Mailer.email_ticket_vote(@poll, @token, current_user).deliver_later
      @exist_vote = false
    else
      @exist_vote = true
    end
  end

  def show_modal_vote
    @poll = Poll.find(params[:poll_id].to_i)
    @session_answers = session[current_user.id.to_s][@poll.id.to_s].blank? ? {} : session[current_user.id.to_s][@poll.id.to_s]
  end

end
