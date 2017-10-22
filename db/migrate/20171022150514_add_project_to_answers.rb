class AddProjectToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :project, foreign_key: true
  end
end
