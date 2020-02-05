class Admin::Widget::CardsController < Admin::BaseController

  def new
    @card = ::Widget::Card.new(header: header_card?)
  end

  def create
    @card = ::Widget::Card.new(card_params)
    @card.init_datetime = card_params[:init_datetime].blank? ? nil : Time.parse(card_params[:init_datetime].to_datetime.strftime('%Y-%m-%d %H:%M'))
    @card.end_datetime = card_params[:end_datetime].blank? ? nil : Time.parse(card_params[:end_datetime].to_datetime.strftime('%Y-%m-%d %H:%M'))
    if @card.save
      notice = "Success"
      redirect_to admin_homepage_url, notice: notice
    else
      render :new
    end
  end

  def edit
    @card = ::Widget::Card.find(params[:id])
  end

  def update
    @card = ::Widget::Card.find(params[:id])
    init_datetime = card_params[:init_datetime].blank? ? nil : Time.parse(card_params[:init_datetime].to_datetime.strftime('%Y-%m-%d %H:%M'))
    end_datetime = card_params[:end_datetime].blank? ? nil : Time.parse(card_params[:end_datetime].to_datetime.strftime('%Y-%m-%d %H:%M'))
    if @card.update(card_params.except(:init_datetime, :end_datetime).merge(init_datetime: init_datetime, end_datetime: end_datetime))
      notice = "Updated"
      redirect_to admin_homepage_url, notice: notice
    else
      render :edit
    end
  end

  def destroy
    @card = ::Widget::Card.find(params[:id])
    @card.destroy

    notice = "Removed"
    redirect_to admin_homepage_url, notice: notice
  end

  private

  def card_params
    params.require(:widget_card).permit(:label, :title, :description, :link_text, :link_url,
                                        :button_text, :button_url, :alignment, :header,
                                        :init_datetime, :end_datetime, :order_number,
                                        image_attributes: [:id, :title, :attachment, :cached_attachment, :user_id, :_destroy])
  end

  def header_card?
    params[:header_card].present?
  end

end
