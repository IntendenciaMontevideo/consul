class PollGroup < ActiveRecord::Base
  has_many :polls

  before_destroy :check_for_polls

  private
  def check_for_polls
    if polls.any?
      errors[:base] << "No se puede eliminar. El grupo se encuentra asociado al menos a una votación"
      return false
    end
  end
end
