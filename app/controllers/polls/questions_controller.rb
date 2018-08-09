class Polls::QuestionsController < ApplicationController

  load_and_authorize_resource :poll
  load_and_authorize_resource :question, class: 'Poll::Question'

  has_orders %w{most_voted newest oldest}, only: :show

  def create_session_answer
    @poll = Poll.find(params[:poll_id].to_i)
    @questions = @poll.questions.for_render.sort_for_list
    session[@poll.id] ||= {}

    if session[@poll.id][@question.id.to_s] == params[:answer_id]
      @is_select_answer = false
      session[@poll.id].delete(@question.id.to_s)
    else
      session[@poll.id][@question.id.to_s] = params[:answer_id]
      @is_select_answer = true
    end
    @session_answers = session[@poll.id]
  end

end
