class CreatePollWidget < ActiveRecord::Migration
  def self.up
    Widget::Feed.create(kind: 'polls')
    Setting.create(key: 'feature.homepage.widgets.feeds.polls', value: '')
  end

  def self.down
    Widget::Feed.find_by(kind: 'polls').delete
    Setting.find_by(key: 'feature.homepage.widgets.feeds.polls').delete
  end
end
