class CreatePollGroup < ActiveRecord::Migration
  def change
    create_table :poll_groups do |t|
      t.string :name
    end

  end
end
