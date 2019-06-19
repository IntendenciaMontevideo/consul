class AddEmailOnNewsletterToUser < ActiveRecord::Migration
  def change
    add_column :users, :email_on_newsletter, :boolean, default: true
  end
end
