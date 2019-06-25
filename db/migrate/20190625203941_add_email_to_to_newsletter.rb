class AddEmailToToNewsletter < ActiveRecord::Migration
  def change
    add_column :newsletters, :email_to, :string
  end
end
