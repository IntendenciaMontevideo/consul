class Admin::Poll::PollGroupsController < Admin::Poll::BaseController
  load_and_authorize_resource

  def create
    @poll_group = PollGroup.new(poll_group_params)
    if @poll_group.save
      redirect_to admin_poll_groups_path, notice: t("flash.actions.create.poll_group")
    else
      render :new
    end
  end

  def update
    if @poll_group.update(poll_group_params)
      redirect_to admin_poll_groups_path, notice: t("flash.actions.update.poll_group")
    else
      render :edit
    end
  end

  def destroy
    if @poll_group.destroy
      redirect_to admin_poll_groups_path, notice: t("flash.actions.destroy.poll_group")
    else
      redirect_to admin_poll_groups_path, notice: @poll_group.errors.messages[:base].first
    end
  end

  def download_report
    @poll_group = PollGroup.find(params[:poll_group_id].to_i)
    @poll_voter_by_groups = Poll::Voter
                              .includes(:poll)
                              .joins(:poll)
                              .where(origin: "web", polls:{poll_group_id: params[:poll_group_id].to_i})
                              .order('polls.id')
    render xlsx: 'download_report', filename: "Reporte_CI_#{@poll_group.name.split(" ").join('_')}.xlsx"
  end

  private
  def poll_group_params
    attributes = [:name]
    params.require(:poll_group).permit(*attributes)
  end

end
