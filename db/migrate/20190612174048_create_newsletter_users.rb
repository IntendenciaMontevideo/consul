class CreateNewsletterUsers < ActiveRecord::Migration
  def change
    create_table :newsletter_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :newsletter, index: true, foreign_key: true
      t.boolean :delivery, default: false
      t.datetime :delivery_at

      t.timestamps null: false
    end
  end
end
