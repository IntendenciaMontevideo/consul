class CreateHomePageButtonsSettings < ActiveRecord::Migration
  def self.up
    Setting.create(key: 'home_show_buttons', value: true)
    Setting.create(key: 'home_statistics', value: '')
    Setting.create(key: 'home_winning_proposals', value: '')
    Setting.create(key: 'home_next_cycle', value: '')
    Setting.create(key: 'home_memory', value: '')
  end

  def self.down
    Setting.find_by(key: 'home_show_buttons').delete
    Setting.find_by(key: 'home_memory').delete
    Setting.find_by(key: 'home_next_cycle').delete
    Setting.find_by(key: 'home_winning_proposals').delete
    Setting.find_by(key: 'home_statistics').delete
  end
end
