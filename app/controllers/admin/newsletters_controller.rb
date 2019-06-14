class Admin::NewslettersController < Admin::BaseController

  def index
    @newsletters = Newsletter.all.order(created_at: :asc)
  end

  def show
    @newsletter = Newsletter.find(params[:id])
  end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    @newsletter.user_ids = @newsletter.list_of_recipient_emails.ids
    if @newsletter.save
      notice = t("admin.newsletters.create_success")
      redirect_to [:admin, @newsletter], notice: notice
    else
      render :new
    end
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def cancel
    @newsletter = Newsletter.find(params[:id])
    @newsletter.cancel!
    redirect_to admin_newsletter_path(@newsletter)
  end

  def restart
    @newsletter = Newsletter.find(params[:id])
    @newsletter.restart!
    redirect_to admin_newsletter_path(@newsletter)
  end

  def pause
    @newsletter = Newsletter.find(params[:id])
    @newsletter.pause!
    redirect_to admin_newsletter_path(@newsletter)
  end

  def update
    @newsletter = Newsletter.find(params[:id])
    @newsletter.user_ids = @newsletter.list_of_recipient_emails.ids

    if @newsletter.update(newsletter_params)
      redirect_to [:admin, @newsletter], notice: t("admin.newsletters.update_success")
    else
      render :edit
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy

    redirect_to admin_newsletters_path, notice: t("admin.newsletters.delete_success")
  end

  def deliver
    @newsletter = Newsletter.find(params[:id])

    unless @newsletter.test_email.blank?
      #@newsletter.initializate!
      #@newsletter.mails_not_sended.each do |newsletter_user|
      Mailer.newsletter(@newsletter, @newsletter.test_email).deliver_later
       # newsletter_user.delivered!
      #end

      #@newsletter.update(sent_at: Time.current)
      flash[:notice] = t("admin.newsletters.send_success")
    else
      flash[:error] = "El newsletter no tiene email de prueba."
    end

    redirect_to [:admin, @newsletter]
  end

  private

    def newsletter_params
      params.require(:newsletter).permit(:subject, :segment_recipient, :from, :body, :test_email)
    end
end
