class AddOrderNumberToPollQuestions < ActiveRecord::Migration
  def change
    add_column :poll_questions, :order_number, :integer
  end
end
