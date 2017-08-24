class ChangeAnswersTopicIdToNullable < ActiveRecord::Migration[5.1]
  def change
  	change_column :answers, :topic_id, :integer, :null => true
  end
end
