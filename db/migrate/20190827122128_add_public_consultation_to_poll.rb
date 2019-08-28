class AddPublicConsultationToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :public_consultation, :boolean, default: false
  end
end
