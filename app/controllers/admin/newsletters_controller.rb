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
    @newsletter = Newsletter.new(newsletter_params.merge(status: Newsletter::STATUS[:paused]))
    @newsletter.user_ids = @newsletter.list_of_recipient_emails.users_email_on_newsletter.ids.uniq
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
    @newsletter.user_ids = @newsletter.list_of_recipient_emails.users_email_on_newsletter.ids.uniq

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
      Mailer.newsletter(@newsletter, [@newsletter.test_email]).deliver_later
       # newsletter_user.delivered!
      #end

      #@newsletter.update(sent_at: Time.current)
      flash[:notice] = t("admin.newsletters.send_success")
    else
      flash[:error] = "El newsletter no tiene email de prueba."
    end

    redirect_to [:admin, @newsletter]
  end

  def remove_email
    @newsletter = Newsletter.find(params[:id])
    newsletter_user = @newsletter.newsletter_users.where(id: params[:newsletter_user]).last
    email = newsletter_user.user.email
    if newsletter_user.destroy
      flash[:notice] = "Se quito del newsletter el email #{email}"
    else
      flash[:error] = "Ocurrio un erro al quita el email #{email} del newsletter"
    end
    render :show
  end

  private

    def newsletter_params
      params.require(:newsletter).permit(:subject, :segment_recipient, :from, :body, :test_email, :email_to)
    end
end
