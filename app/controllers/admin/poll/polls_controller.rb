class Admin::Poll::PollsController < Admin::Poll::BaseController
  load_and_authorize_resource

  before_action :load_search, only: [:search_booths, :search_officers]
  before_action :load_geozones, only: [:new, :create, :edit, :update]

  def index
  end

  def show
    @poll = Poll.includes(:questions).
                          order('poll_questions.order_number').
                          find(params[:id])
  end

  def new
  end

  def create
    @poll = Poll.new(poll_params.merge(author: current_user))
    if @poll.save
      redirect_to [:admin, @poll], notice: t("flash.actions.create.poll")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @poll.update(poll_params)
      redirect_to [:admin, @poll], notice: t("flash.actions.update.poll")
    else
      render :edit
    end
  end

  def add_question
    question = ::Poll::Question.find(params[:question_id])

    if question.present?
      @poll.questions << question
      notice = t("admin.polls.flash.question_added")
    else
      notice = t("admin.polls.flash.error_on_question_added")
    end
    redirect_to admin_poll_path(@poll), notice: notice
  end

  def booth_assignments
    @polls = Poll.current_or_incoming
  end

  def download_report
    @poll = Poll.find(params[:poll_id])
    render xlsx: 'download_report', filename: "Reporte_#{@poll.name.split(" ").join('_')}.xlsx"
  end

  private

    def load_geozones
      @geozones = Geozone.all.order(:name)
    end

    def poll_params
      image_attributes = [:id, :title, :attachment, :cached_attachment, :user_id, :_destroy]
      attributes = [:name, :poll_group_id, :starts_at, :ends_at, :geozone_restricted, :summary, :description, :featured,
                    :results_enabled, :stats_enabled, :access_level, :number_votes_allowed, :public_consultation, geozone_ids: [],
                    image_attributes: image_attributes]
      params.require(:poll).permit(*attributes)
    end

    def search_params
      params.permit(:poll_id, :search)
    end

    def load_search
      @search = search_params[:search]
    end

end
