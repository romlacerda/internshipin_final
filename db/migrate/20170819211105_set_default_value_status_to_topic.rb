class SetDefaultValueStatusToTopic < ActiveRecord::Migration[5.1]
  def change
  	change_column :topics, :status, :integer, :limit => 1, :default => false
  end
end
