class AddTestEmailToNewsletter < ActiveRecord::Migration
  def change
    add_column :newsletters, :test_email, :string
  end
end
