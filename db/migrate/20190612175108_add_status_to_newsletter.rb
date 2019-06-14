class AddStatusToNewsletter < ActiveRecord::Migration
  def change
    add_column :newsletters, :status, :integer, default: Newsletter::STATUS[:not_initializate]
  end
end
