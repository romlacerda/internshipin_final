class AddAnswerToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :answer, foreign_key: true, null: true
  end
end
